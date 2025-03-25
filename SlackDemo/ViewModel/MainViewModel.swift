//
//  MainViewModel.swift
//  SlackDemo
//
//  Created by Yarok on 3/24/25.
//

import Foundation

final class MainViewModel {
    var conversation: Conversation?
    private let sampleDataService: SampleDataServicing = SampleDataService()

    init() {
        initDataSource()
    }

    func initDataSource() {
        self.conversation = sampleDataService.getConversations(count: 1)[0]
    }
    
    func getCurrentUser() -> User {
        return sampleDataService.getCurrentUser()
    }
    
    func getAllUsers() -> [User] {
        return sampleDataService.getAllUsers()
    }
}
