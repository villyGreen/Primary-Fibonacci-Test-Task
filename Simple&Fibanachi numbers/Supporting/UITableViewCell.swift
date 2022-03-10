//
//  UITableViewCell.swift
//  Simple&Fibanachi numbers
//
//  Created by zz on 10.03.2022.
//  Copyright © 2022 Vadim Vitkovskiy. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    static let id = "Cell"
    var firstLabel = UILabel()
    var secondLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier : reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.selectionStyle = .none
        firstLabel.font = UIFont.systemFont(ofSize: 30)
        secondLabel.font = UIFont.systemFont(ofSize: 30)
        firstLabel.backgroundColor = .brown
        firstLabel.textAlignment = .center
        firstLabel.adjustsFontSizeToFitWidth = true
        secondLabel.adjustsFontSizeToFitWidth = true
        secondLabel.textAlignment = .center
        secondLabel.backgroundColor = .cyan
        let contentStackView = UIStackView(arrangedSubviews: [firstLabel,secondLabel])
        contentStackView.axis = .horizontal
        contentStackView.spacing = 0
        contentStackView.distribution = .fillEqually
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            
            contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
}
