//
//  TodoDetailViewController.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/28.
//  Copyright © 2020 JSilver. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {
    // MARK: - Layout
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    // MARK: - Property
    var todo: ToDo?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = todo?.content
        descriptionLabel.text = todo?.description
        
        switch todo?.priority {
        case .high:
            priorityLabel.text = "High"
            
        case .medium:
            priorityLabel.text = "Medium"
            
        case .low:
            priorityLabel.text = "Low"
            
        default:
            return
        }
    }
    
    // MARK: - Private
    
    // MARK: - Action
}
