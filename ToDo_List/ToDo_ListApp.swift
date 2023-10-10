//
//  ToDo_ListApp.swift
//  ToDo_List
//
//  Created by Uğurcan Çırak on 30.09.2023.
//

import SwiftUI

@main
struct ToDo_ListApp: App {
    
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
