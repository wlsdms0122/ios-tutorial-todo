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
    private let TODO_LIST_CELL_IDENTIFIER = "ToDoListTableViewCell"
    private let MAIN_STORYBOARD_IDENTIFIER = "Main"
    private let TODO_ADD_VIEW_IDENTIFIER = "TodoAddViewController"
    private let TODO_DETAIL_VIEW_IDENTIFIER = "TodoDetailViewController"
    
    // MARK: - Layout
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var toDoListTableView: UITableView!
    
    // MARK: - Property
    private var todos: [ToDo] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // A-1. TableView 의 Data Source(Adapter) 를 설정
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
        
        // A-2. Add Button Layer 수정
        addButton.layer.borderColor = addButton.tintColor.cgColor
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 8
    }
    
    // MARK: - Private
    private func addTodo(_ todo: String) {
        // B-1. 새로운 `To Do` 항목을 추가
        let todo = ToDo(content: todo)
        todos.append(todo)
        // B-2. TableView 를 업데이트 (갱신)
        toDoListTableView.reloadData()
    }

    // MARK: - Action
    @IBAction func addButtonTapped(_ sender: Any) {
        // C-1. Storyboard 에서 ViewController 생성
        let storyboard = UIStoryboard(name: MAIN_STORYBOARD_IDENTIFIER, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: TODO_ADD_VIEW_IDENTIFIER) as? TodoAddViewController else { return }
        
        // C-2. Add ViewController 로부터 데이터를 받기위해 delegate 설정
        viewController.delegate = self
        
        // C-3. `present` 방식을 통해 ViewController 화면 전환
        present(viewController, animated: true, completion: nil)
    }
}

// D-1. `TodoListViewController` 의 확장(extension)으로 `UITableViewDataSource` protocol(Interfcae) 를 채택
extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    // D-2. 필수로 구현하여햐 하는 method 작성
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // E-1. Section 을 구성하는 Item 의 갯수를 반환
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // F-1. TableView 에서 관리하는 재사용 셀(Reusable Cell)을 얻음.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TODO_LIST_CELL_IDENTIFIER, for: indexPath) as? ToDoListTableViewCell else { fatalError() }
        // F-2. 현재 index 의 To Do Item 을 가져옴
        let todo = todos[indexPath.item]
        // F-3. To Do 내용을 Cell 의 Label 에 설정
        cell.contentLabel.text = todo.content
        // F-4. To Do 생성 날짜를 `DateFormatter` 를 통해 문자열로 변환하여 Cell 의 Label 에 설정
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd hh:mm"
        cell.createAtLabel.text = dateFormatter.string(from: todo.createAt)
        // F-5. To Do 완료 여부를 Cell 의 Button 에 설정
        cell.doneButton.isDone = todo.isDone
        
        // F-6. To Do Cell 의 이벤트를 처리하기 위한 속성 및 Delegate 를 할당
        cell.index = indexPath.item
        cell.delegate = self
        
        return cell
    }
    
    // H-1. Cell 선택시 Navigation push
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: MAIN_STORYBOARD_IDENTIFIER, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: TODO_DETAIL_VIEW_IDENTIFIER) as? TodoDetailViewController else { return }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension TodoListViewController: ToDoListTableViewCellDelegate {
    func done(_ index: Int) {
        // G-1. 이벤트가 발생한 To Do Item 의 상태를 변경
        todos[index].isDone.toggle()
        // G-2. TableView 를 업데이트 (갱신)
        toDoListTableView.reloadData()
    }
}

extension TodoListViewController: TodoAddViewControllerDelegate {
    func add(todo: ToDo) {
        // H-1. 전달받은 ToDo Item 을 배열에 추가
        todos.insert(todo, at: 0)
        // H-2. TableView 를 업데이트 (갱신)
        toDoListTableView.reloadData()
    }
}
