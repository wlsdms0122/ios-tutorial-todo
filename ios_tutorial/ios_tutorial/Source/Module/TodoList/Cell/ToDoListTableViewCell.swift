//
//  ToDoListTableViewCell.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/19.
//  Copyright © 2020 JSilver. All rights reserved.
//

import UIKit

// B-1. To Do List Cell 의 이벤트를 밖으로 전달하는 Delegate 선언
protocol ToDoListTableViewCellDelegate: AnyObject {
    // B-2. 완료 버튼 누를때 호출될 Method 정의
    func done(_ index: Int)
}

class ToDoListTableViewCell: UITableViewCell {
    // MARK: - Layout
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Property
    // C-1. 이벤트 전달을 위한 속성 추가
    var index: Int = 0
    weak var delegate: ToDoListTableViewCellDelegate?
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        // A-1. Cell 이 재사용 될 때 기존의 정보를 초기화 시킴
        index = 0
        contentLabel.text = ""
        createAtLabel.text = ""
        doneButton.isSelected = false
    }
    
    // MARK: - Action
    @IBAction func doneButtonTapped(_ sender: Any) {
        // D-1. 완료 버튼을 누르면 Delegate 를 통해 이벤트 전달
        delegate?.done(index)
    }
}
