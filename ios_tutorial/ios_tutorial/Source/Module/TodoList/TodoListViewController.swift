//
//  TodoListViewController.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/19.
//  Copyright © 2020 JSilver. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    // MARK: - Constant
    private let TODO_LIST_CELL_IDENTIFIER = "UITableViewCell"
    
    // MARK: - Layout
    @IBOutlet private weak var toDoItemTextField: UITextField!
    @IBOutlet private weak var toDoListTableView: UITableView!
    
    // MARK: - Property
    private var todos: [String] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // A-1. TableView 의 Data Source(Adapter) 를 설정
        toDoListTableView.dataSource = self
    }
    
    // MARK: - Private
    private func addTodo(_ todo: String) {
        // B-1. 새로운 `To Do` 항목을 추가
        todos.append(todo)
        // B-2. TableView 를 업데이트 (갱신)
        toDoListTableView.reloadData()
    }

    // MARK: - Action
    @IBAction func addButtonTapped(_ sender: Any) {
        // C-1. TextField 로부터 입력 값을 읽음
        guard let todo = toDoItemTextField.text else { return }
        // C-2. 입력 필드 초기화
        toDoItemTextField.text = ""
        // C-3. 입력된 항목을 데이터에 추가
        addTodo(todo)
    }
}

// D-1. `TodoListViewController` 의 확장(extension)으로 `UITableViewDataSource` protocol(Interfcae) 를 채택
extension TodoListViewController: UITableViewDataSource {
    // D-2. 필수로 구현하여햐 하는 method 작성
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // E-1. Section 을 구성하는 Item 의 갯수를 반환
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // F-1. TableView 에서 관리하는 재사용 셀(Reusable Cell)을 얻음.
        let cell = tableView.dequeueReusableCell(withIdentifier: TODO_LIST_CELL_IDENTIFIER, for: indexPath)
        // F-2. Cell 의 Label 에 To Do 항목을 설정하여 반환
        cell.textLabel?.text = todos[indexPath.item]
        return cell
    }
}
