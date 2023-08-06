//
//  ListView.swift
//  TodoApp
//
//  Created by Telles Ivan on 8/5/23.
//

import SwiftUI

struct ListView: View {
   @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
       ZStack{
          if listViewModel.items.isEmpty {
             EmptyListView()
                .transition(AnyTransition.opacity.animation(.easeInOut))
          } else {
             List{
                ForEach(listViewModel.items) {item in
      				TaskItemModel(item: item)
                      .onTapGesture {
                         withAnimation(.linear) {
                            listViewModel.updateItem(item)
                         }                      }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
                
             }
             .navigationTitle("Task List")
             .navigationBarTitleDisplayMode(.inline)
             .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
          }
       }
    }
}

#Preview {
   ListView().environmentObject(ListViewModel())
}
