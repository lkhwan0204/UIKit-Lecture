//
//  UserData.swift
//  userviewEx
//
//  Created by kyuhyeon Lee on 3/10/25.
//


import Foundation

struct UserData {
    var name: String
    var age: Int
    
    mutating func increaseAge() {
        self.age += 1
    }
}