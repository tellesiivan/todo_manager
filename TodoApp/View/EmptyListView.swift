//
//  EmptyListView.swift
//  TodoApp
//
//  Created by Telles Ivan on 8/5/23.
//

import SwiftUI

struct EmptyListView: View {
   @State var animate: Bool = false
   
    var body: some View {
       ScrollView {
          VStack(spacing: 20){
             Text("There are no items !!")
                .font(.title2)
                .fontWeight(.bold)
             Text("Be more productive and add some todos to finish them on time.")
                .font(.footnote)
                .padding(.bottom, 20)
             NavigationLink(destination: AddView(), label: {
                Text("Add a new todo")
                   .foregroundStyle(.black)
                   .font(.headline)
                   .frame(height: 55)
                   .frame(maxWidth: .infinity)
                   .background(self.animate ? Color("NewColor") : .accentColor)
                   .clipShape(.rect(cornerRadius: 8))
             })
             .padding(.horizontal, self.animate ? 30:50 )
          }
       }
       .multilineTextAlignment(.center)
       .padding(.vertical, 60)
       .padding(.horizontal, 10)
       .onAppear(perform: initializeAnimation)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
     
          .navigationTitle("Task Manager")
          .navigationBarTitleDisplayMode(.inline)
          .navigationBarTitleDisplayMode(.inline)
    }
   
   
   func initializeAnimation(){
//      check if animate is a Bool value, IF it is NOT...RETURN
      guard !self.animate else {
         return
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
         withAnimation(Animation.easeInOut(duration: 1.8).repeatForever(), {
            self.animate.toggle()
         })
      })
   }
   
}

#Preview {
    EmptyListView()
}
