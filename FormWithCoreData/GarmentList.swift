//
//  ContentView.swift
//  FormWithCoreData
//
//  Created on 23/12/20.
//

import SwiftUI
import CoreData


struct AddButton<Destination : View>: View {
    var destination:  Destination
    var body: some View {
        NavigationLink(destination: self.destination) { Image(systemName: "plus") }
    }
}

struct GarmentList: View {
    @Environment(\.managedObjectContext) var viewContextt
    @EnvironmentObject var garmentViewModel : GarmentViewModel
    @State var isNavigated = false
    let ListKey: LocalizedStringKey = "List"
    init()
    {
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
    }
    var body: some View {
        NavigationView{
            List {
                Picker.init("", selection: $garmentViewModel.selection) {
                    ForEach(SortType.allCases){ item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                ForEach(garmentViewModel.garments) { garment in
                    Text("\(garment.name!)")
                }
                .onDelete(perform: garmentViewModel.deleteGarments)
            }.sheet(isPresented: $isNavigated, content: {
                AddGarmentView()
            })
            .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
            .navigationBarTitle(ListKey)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:EditButton(),trailing: Button(action: {isNavigated = true}, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentList()
    }
}
