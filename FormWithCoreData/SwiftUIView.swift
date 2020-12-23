//
//  SwiftUIView.swift
//  FormWithCoreData
//
//  Created on 23/12/20.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView{
                List{
                    Image(systemName: "Star").resizable().aspectRatio(contentMode: .fit)
                    Text("ewdf")
                    Text("sdfd")
                }.navigationBarTitle("lkds")
                .navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
