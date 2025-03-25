//
//  ConersationCell.swift
//  SlackDemo
//
//  Created by Yarok on 3/19/25.
//

import UIKit

class ConversationCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
