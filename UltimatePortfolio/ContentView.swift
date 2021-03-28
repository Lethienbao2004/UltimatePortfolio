//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 11/4/20.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedView") var selectedString: String?
    @EnvironmentObject var dataController: DataController
    var body: some View {
        TabView(selection: $selectedString) {
            HomeView(dataController: dataController)
                .tag(HomeView.tag)
                .tabItem { Label("Home", systemImage: "house") }
            ProjectsView(dataController: dataController, showClosedProjects: false)
                .tag(ProjectsView.openTag)
                .tabItem { Label("Open", systemImage: "list.bullet") }
            ProjectsView(dataController: dataController, showClosedProjects: true)
                .tag(ProjectsView.closedTag)
                .tabItem { Label("Closed", systemImage: "checkmark") }
            AwardsView()
                .tag(AwardsView.tag)
                .tabItem { Label("Awards", systemImage: "rosette") }
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
