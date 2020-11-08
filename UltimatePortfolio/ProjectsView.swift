//
//  ProjectsView.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 11/7/20.
//

import SwiftUI

struct ProjectsView: View {
    let showedClosedProjects: Bool
    let projects: FetchRequest<Project>
    
    init(showedClosedProjects: Bool) {
        self.showedClosedProjects = showedClosedProjects
        projects = FetchRequest<Project>(
            entity: Project.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)],
            predicate: NSPredicate(format: "closed = %d", showedClosedProjects)
        )
        
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(projects.wrappedValue) { project in
                    Section(header: Text(project.title ?? "")) {
                        ForEach(project.items?.allObjects as? [Item] ?? []) { item in
                            Text(item.title ?? "")
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showedClosedProjects ? "Closed Projects" : "Open Projects")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        ProjectsView(showedClosedProjects: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
