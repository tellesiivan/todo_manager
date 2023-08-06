//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Telles Ivan on 8/3/23.
//

import Foundation

class ListViewModel: ObservableObject {
   @Published var items: [ItemModel] = [] {
         //   as soon a new item is added and sets, we want to save the items items
      didSet{
         self.saveItems()
      }
   }
   
   let itemsKeys: String = "items_list"
   
//   as soon as someone initializes ListViewModel, we want to get the saved items
   init(){
      self.getItems()
   }
   
   func saveItems() {
//      something like JSON.Stringify()
//      we check if we can encode the items, if we can then use that ecodeData to set UserDefaults.
      if let encodeData = try? JSONEncoder().encode(items) {
         UserDefaults.standard.set(encodeData, forKey: itemsKeys)
      }
   }
   
   func getItems(){
      guard let data = UserDefaults.standard.data(forKey: itemsKeys) else {
         return
      }
      
      if let savedItems = try? JSONDecoder().decode(Array<ItemModel>.self, from: data) {
         return self.items = savedItems
      } else {
         return
      }
   }
   
//    CRUD operations
   
   func addItem(_ title: String) {
      let newItem: ItemModel = ItemModel(IsCompleted: false, Title: title)
//      as soon as we add a new item, we save them (saveItems func) & the ui is updated
      self.items.append(newItem)
   }
   
   func updateItem(_ item: ItemModel) {
      if let index = items.firstIndex(where: { $0.id == item.id}) {
         items[index] = item.updateCompleted()
      }
   }
   
   func deleteItem(_ indexSet: IndexSet) {
      items.remove(atOffsets: indexSet)
   }
   
   func moveItem(_ from: IndexSet, _ to: Int) {
      items.move(fromOffsets: from, toOffset: to)
   }
   
}
