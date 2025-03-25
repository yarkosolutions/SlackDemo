//
//  User.swift
//  SlackDemo
//
//  Created by Yarko on 3/24/25.
//


import UIKit

class User {
        let id: String = UUID().uuidString
        let image: UIImage
        let name: String
        
        init(name: String, image: UIImage) {
            self.image = image
            self.name = name
        }
    }
