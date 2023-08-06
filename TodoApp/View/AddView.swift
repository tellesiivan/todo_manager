//
//  AddView.swift
//  TodoApp
//
//  Created by Telles Ivan on 8/5/23.
//

import SwiftUI

struct AddView: View {
   @EnvironmentObject var listViewModel: ListViewModel
   @State var textFieldValue: String = ""
   @State var alertTitle: String = ""
   @State var showAlert: Bool = false
   
//   dismiss view
   @Environment(\.presentationMode) var presentationMode
   
   func getAlert() -> Alert {
      return Alert(title: Text(self.alertTitle))
   }
   
   func textIsValid() -> Bool {
      if self.textFieldValue.count < 3 {
         self.alertTitle = "Your task should contain atleast 3 characters"
         self.showAlert.toggle()
         return false
      }
      return true
   }
   
   func handleSaveTaskModelTap() {
      guard textIsValid() else {
         return
      }
      listViewModel.addItem(self.textFieldValue)
      presentationMode.wrappedValue.dismiss()
   }
   
    var body: some View {
       ScrollView(){
          VStack(spacing: 25){
             TextField("Add your task here...", text: self.$textFieldValue)
                .padding(.horizontal, 8)
                .frame(height: 55)
                .background(Color.init(hue: 0.621, saturation: 0.048, brightness: 0.916))
                .clipShape(.rect(cornerRadius: 10))
             Button(action: handleSaveTaskModelTap, label: {
                Text("Add Task")
                   .font(.system(.subheadline))
                   .foregroundStyle(.white)
             })
             .frame(height: 55)
             .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
             .background(.black)
             .clipShape(.rect(cornerRadius: 10))
          }
          .padding(.horizontal)
          .padding(.vertical, 20)
       }.navigationBarTitleDisplayMode(.inline)
          .navigationTitle("Add a task")
          .alert(isPresented: self.$showAlert , content: getAlert)
    }
}

#Preview {
    AddView()
}
