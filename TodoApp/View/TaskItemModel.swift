//
//  TaskItemModel.swift
//  TodoApp
//
//  Created by Telles Ivan on 8/5/23.
//

import SwiftUI

let item: ItemModel = ItemModel(IsCompleted: true, Title: "Walk Delta")
struct TaskItemModel: View {
   let item: ItemModel
   
    var body: some View {
       HStack(){
          Image(systemName: item.isCompleted ? "checkmark.circle" : "circle" )
             .foregroundStyle(item.isCompleted ? .green : .red)
          Text(item.title)
          Spacer()
       }
       .font(.title2)
       .padding(.vertical, 8)
    }
}

#Preview {
    TaskItemModel(item: item)
}
