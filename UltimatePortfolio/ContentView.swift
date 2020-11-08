//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 11/4/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            ProjectsView(showedClosedProjects: false)
                .tabItem { Label("Open", systemImage: "list.bullet") }
            ProjectsView(showedClosedProjects: true)
                .tabItem { Label("Closed", systemImage: "checkmark") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
        
    }
}
