//
//  AddGarmentView.swift
//  FormWithCoreData
//
//  Created on 23/12/20.
//

import SwiftUI

struct AddGarmentView: View {
    @EnvironmentObject var garmentViewModel : GarmentViewModel
    @Environment(\.presentationMode) var showModal: Binding<PresentationMode>
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Garment Name")
                TextField("Enter name", text: $garmentViewModel.currentGarmentName)
                Divider()
            }
            Spacer()
        }.padding()
        .navigationBarTitle("ADD")
        .navigationBarItems(trailing:
                                Button(action:{ garmentViewModel.addGarment()
                                    showModal.wrappedValue.dismiss()
                                }) {
                                    Text("Save")
                                }
        )
    }
}

struct AddGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddGarmentView()
    }
}
