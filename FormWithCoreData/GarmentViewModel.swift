//
//  GarmentViewModel.swift
//  FormWithCoreData
//
//  Created on 23/12/20.
//
import CoreData
import SwiftUI
import Foundation

enum SortType : String, Identifiable,CaseIterable{
    case alpha
    case time
    var id: String{
        return self.rawValue
    }
}

class GarmentViewModel: ObservableObject {
    private var viewContext = PersistenceController.shared.container.viewContext
    @Published var selection : String = SortType.alpha.rawValue{
        didSet{
            refreshData()
        }
    }
    @Published var currentGarmentName : String = ""
    @Published var garments: [Garment] = []
    private var garmentResults: NSFetchedResultsController<Garment>?
//    var garments: FetchedResults<Garment> { fetchRequest.wrappedValue }
    
    init(){
        refreshData()
    }
    
    func refreshData(){
        let request: NSFetchRequest<Garment> = Garment.fetchRequest()
        if selection == SortType.alpha.rawValue{
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        }
        else{
            request.sortDescriptors = [NSSortDescriptor(key: "createdTime", ascending: true)]
        }
        garmentResults = NSFetchedResultsController(fetchRequest: request,
                                                    managedObjectContext: viewContext,
                                                    sectionNameKeyPath: nil, cacheName: nil)
        do {
            try garmentResults?.performFetch()
            garments = garmentResults?.fetchedObjects ?? []
        } catch {
            print("failed to fetch items!")
        }
    }
    
    fileprivate func saveAndRefresh() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        refreshData()
    }
    
    func addGarment() {
        let newGarment = Garment(context: viewContext)
        newGarment.name = self.currentGarmentName
        newGarment.createdTime = Date()
        self.currentGarmentName = ""
        saveAndRefresh()
    }
    
    func deleteGarments(offsets: IndexSet) {
        withAnimation {
            offsets.map { garments[$0] }.forEach(viewContext.delete)
            saveAndRefresh()
        }
    }
}
