//
//  HomeView.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 11/7/20.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Add Data"){
                    dataController.deleteAll()
                    try? dataController.createSampleData()
                }
            }
            .navigationTitle("Home")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
