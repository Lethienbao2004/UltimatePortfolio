//
//  HomeViewModel.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 3/27/21.
//

import Foundation
import CoreData

extension HomeView {
    class ViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
        private let projectsController: NSFetchedResultsController<Project>
        private let itemsController: NSFetchedResultsController<Item>
        
        @Published var projects = [Project]()
        @Published var items = [Item]()
        
        var dataController: DataController
        
        init(dataController: DataController) {
            // Construct a fetch request to show all open projects.
            self.dataController = dataController
            
            let projectRequest: NSFetchRequest<Project> = Project.fetchRequest()
            projectRequest.predicate = NSPredicate(format: "closed = false")
            projectRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Project.title, ascending: true)]
            
            projectsController = NSFetchedResultsController(
                fetchRequest: projectRequest,
                managedObjectContext: dataController.container.viewContext,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            
            // Construct a fetch request to show the 10 highest-priority,
            // incomplete items from open projects.
            let itemRequest: NSFetchRequest<Item> = Item.fetchRequest()
            itemRequest.predicate = NSPredicate(format: "completed = false")
            itemRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Item.priority, ascending: true)]
            itemRequest.fetchLimit = 10
            
            itemsController = NSFetchedResultsController(
                fetchRequest: itemRequest,
                managedObjectContext: dataController.container.viewContext,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            
            super.init()
            projectsController.delegate = self
            itemsController.delegate = self
            
            do {
                try projectsController.performFetch()
                try itemsController.performFetch()
                
                projects = projectsController.fetchedObjects ?? []
                items = itemsController.fetchedObjects ?? []
            } catch {
                fatalError("Failed to load data initially")
            }
        }
        
        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            if let newItems = controller.fetchedObjects as? [Item] {
                items = newItems
            } else if let newProjects = controller.fetchedObjects as? [Project] {
                projects = newProjects
            }
        }
        
        var upNext: ArraySlice<Item> {
            items.prefix(3)
        }
        
        var moreToExplore: ArraySlice<Item> {
            items.dropFirst(3)
        }
        
        func addSampleData() {
            dataController.deleteAll()
            try? dataController.createSampleData()
        }
        
    }
}
