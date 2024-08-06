//
//  ItemModel.swift
//  TodoList
//
//  Created by Bikram Singh on 22/07/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    var isCompleted: Bool
}
