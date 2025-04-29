//
//  Todo.swift
//  comstudianApp2
//
//  Created by kyuhyeon Lee on 3/28/25.
//


import Foundation

struct Todo: Codable {
    let id: String
    let title: String
    let isCompleted: Bool
}