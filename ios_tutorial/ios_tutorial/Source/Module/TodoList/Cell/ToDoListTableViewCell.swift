//
//  ToDoListTableViewCell.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/19.
//  Copyright © 2020 JSilver. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    // MARK: - Layout
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        // A-1. Cell 이 재사용 될 때 기존의 정보를 초기화 시킴
        contentLabel.text = ""
        createAtLabel.text = ""
        doneButton.isSelected = false
    }
}
