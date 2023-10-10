//
//  ItemModel.swift
//  ToDo_List
//
//  Created by Uğurcan Çırak on 30.09.2023.
//

import Foundation


//Immutable struct 
struct ItemModel : Identifiable, Codable {
    
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String , isCompleted: Bool){
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
