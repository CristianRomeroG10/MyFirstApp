//
//  User.swift
//  MyFirstApp
//
//  Created by Cristian guillermo Romero garcia on 26/07/23.
//

import Foundation

struct User{
    let name: String
    let email: String
    let phone: String
    let age: Int
    
    init(name: String, email: String, phone: String, age: Int) {
        self.name = name
        self.email = email
        self.phone = phone
        self.age = age
    }
}
