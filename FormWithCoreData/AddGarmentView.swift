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
    let GarmentName: LocalizedStringKey = "Garment name"
    let EnterName: LocalizedStringKey = "Enter name"
    let Add: LocalizedStringKey = "Add"
    let Save: LocalizedStringKey = "Save"
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .leading){
                    Text(GarmentName)
                    TextField(EnterName, text: $garmentViewModel.currentGarmentName)
                    Divider()
                }
                Spacer()
                    
            }
            .alert(isPresented: $garmentViewModel.isInvalidName, content: {Alert.init(title: Text(garmentViewModel.errorMessage))})
            .padding()
            .navigationBarTitle(Add)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action:{ garmentViewModel.addGarment()
                                        if !garmentViewModel.isInvalidName{
                                            showModal.wrappedValue.dismiss()
                                        }
                                    }) {
                                        Text(Save)
                                    }
            )
        }
        
    }
}

struct AddGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddGarmentView()
    }
}
