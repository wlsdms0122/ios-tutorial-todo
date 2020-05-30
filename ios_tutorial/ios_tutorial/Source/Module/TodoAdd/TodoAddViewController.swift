//
//  TodoAddViewController.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/26.
//  Copyright © 2020 JSilver. All rights reserved.
//

import UIKit

// B-1. Add ViewController 의 delegate 정의
protocol TodoAddViewControllerDelegate: AnyObject {
    // B-2. 생성된 ToDo item 전달 method
    func add(todo: ToDo)
}

class TodoAddViewController: UIViewController {
    // MARK: - Layout
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var prioritySegmentControl: UISegmentedControl!
    @IBOutlet private weak var addButton: UIButton!
    
    // MARK: - Property
    weak var delegate: TodoAddViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // A-1. Layout 스타일 지정
        scrollView.contentInset.bottom = 86
        
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.black.cgColor
        
        addButton.layer.borderColor = addButton.backgroundColor?.cgColor
        addButton.layer.cornerRadius = 8
    }
    
    // MARK: - Private
    
    // MARK: - Action
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let content = titleTextField.text,
            let description = descriptionTextView.text,
            let priority = Priority(rawValue: prioritySegmentControl.selectedSegmentIndex) else { return }
        
        // C-1. 새로운 ToDo Item 생성
        let todo = ToDo(content: content, description: description, priority: priority)
        // C-2. Delegate 를 통해 데이터 전달
        delegate?.add(todo: todo)
        // C-3. 현재 창 닫음
        dismiss(animated: true, completion: nil)
    }
}
