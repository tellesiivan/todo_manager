//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Telles Ivan on 8/3/23.
//

import SwiftUI

@main
struct TodoAppApp: App {
   @StateObject var listViewModel: ListViewModel = ListViewModel()
   
    var body: some Scene {
        WindowGroup {
           NavigationView(content: {
              	ListView()
           })
           .environmentObject(listViewModel)
        }
    }
}
