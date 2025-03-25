//
//  Conversation.swift
//  SlackDemo
//
//  Created by Yarko on 3/24/25.
//


import UIKit

class Conversation {
    let title: String
    var messages: [Message]
    var users: [User]
    var lastMessage: Message? { return messages.last }

    init(users: [User], messages: [Message]) {
        self.users = users
        self.messages = messages
        self.title = Lorem.words(nbWords: 4).capitalized
    }
}
