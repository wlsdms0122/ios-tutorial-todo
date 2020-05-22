//
//  DoneButton.swift
//  ios_tutorial
//
//  Created by JSilver on 2020/05/22.
//  Copyright © 2020 JSilver. All rights reserved.
//

import UIKit

class DoneButton: UIControl {
    // MARK: - Layout
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Property
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var isDone: Bool = false {
        didSet {
            title = isDone ? "완료" : "미완료"
            iconImageView.image = isDone ? UIImage(named: "ic_16_check_yes") : UIImage(named: "ic_16_check_no")
        }
    }
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // A-1. Nib 생성
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        // A-2. Nib 파일로부터 View 를 생성
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return nil }
        
        // A-3. View 의 frame 을 초기화 해준 뒤 subview 에 추가
        view.frame = bounds
        addSubview(view)
    }
    
    // Additional 1. Bundle 을 이용하여 Nib 파일을 읽어오는 방법
    private func loadNibFromBundle() -> UIView? {
        guard let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)?.first as? UIView else { return nil }
        return view
    }
}
