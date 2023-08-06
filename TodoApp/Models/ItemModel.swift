//
//  ItemModel.swift
//  TodoApp
//
//  Created by Telles Ivan on 8/3/23.
//

import Foundation

// will be uniquely identifiable
struct ItemModel: Identifiable, Codable {
   let title: String
   let isCompleted: Bool
   let id: String
   
//   will make everyone who uses ItemModel will have a unique id
   init(Id: String = UUID().uuidString, IsCompleted: Bool, Title: String) {
      self.id = Id
      self.isCompleted = IsCompleted
      self.title = Title
   }
   
   func updateCompleted() -> ItemModel {
//      return the existing item but invert isCompleted
      return ItemModel(Id: self.id, IsCompleted: !self.isCompleted, Title: self.title)
   }
   
}
