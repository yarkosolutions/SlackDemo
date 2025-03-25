//
//  SampleData.swift
//  SlackDemo
//
//  Created by Yarko on 3/19/25.
//

import UIKit

protocol SampleDataServicing {
    func getConversations(count: Int) -> [Conversation]
    func getAllUsers() -> [User]
    func getCurrentUser() -> User
}

class SampleDataService: SampleDataServicing {
    
    let users = [
        User(name: "Avatar", image: UIImage(systemName: "person.fill")!),
        User(name: "Ninja", image: UIImage(systemName: "person.fill")!),
        User(name: "Anonymous", image: UIImage(systemName: "person.fill")!),
        User(name: "Rick Sanchez", image: UIImage(systemName: "person.fill")!),
        User(name: "Yarko", image: UIImage(systemName: "person.fill")!)
    ]
    
    var currentUser: User { return users.last! }

    func getConversations(count: Int) -> [Conversation] {
        var conversations = [Conversation]()
        for _ in 0..<count {
            var messages = [Message]()
            for i in 0..<30 {
                let user = users[i % users.count]
                if i % 2 == 0 {
                    let message = Message(user: user, text: Lorem.sentence())
                    messages.append(message)
                } else {
                    let message = Message(user: user, text: Lorem.paragraph())
                    messages.append(message)
                }
            }
            let newConversation = Conversation(users: users, messages: messages)
            conversations.append(newConversation)
        }
        return conversations
    }
    
    func getAllUsers() -> [User] {
        return users
    }
    
    func getCurrentUser() -> User {
        return currentUser
    }
}
