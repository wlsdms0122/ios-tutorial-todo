//
//  TodoAddViewController.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/26.
//  Copyright © 2020 JSilver. All rights reserved.
//

import UIKit

class TodoAddViewController: UIViewController {
    // MARK: - Layout
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var addButton: UIButton!
    
    // MARK: - Property
    
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
}
