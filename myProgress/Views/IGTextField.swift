//
//  IGTextField.swift
//  myProgress
//
//  Created by Lucian Cerbu on 06.03.2022.
//

import UIKit

class IGTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        leftViewMode = .always
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
        backgroundColor = .secondarySystemBackground
        autocapitalizationType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
