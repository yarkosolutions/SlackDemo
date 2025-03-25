//
//  Message.swift
//  SlackDemo
//
//  Created by Yarko on 3/24/25.
//


import UIKit

class Message {
    let text: String
    let user: User
    
    init(user: User, text: String) {
        self.user = user
        self.text = text
    }
}
