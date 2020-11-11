//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 11/4/20.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedView") var selectedString: String?
    var body: some View {
        TabView(selection: $selectedString) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem { Label("Home", systemImage: "house") }
            ProjectsView(showedClosedProjects: false)
                .tag(ProjectsView.openTag)
                .tabItem { Label("Open", systemImage: "list.bullet") }
            ProjectsView(showedClosedProjects: true)
                .tag(ProjectsView.closedTag)
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
