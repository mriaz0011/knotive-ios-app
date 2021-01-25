//
//  ContactSearchUI.swift
//  SlideMenuApp
//
//  Created by Muhammad Riaz on 29/12/2020.
//

import SwiftUI

struct ContactSearchUI: View {
    
    @State private var name = ""
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Color.yellow
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $name)
                Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            //            .navigationTitle(Text(""))
            //            .navigationBarHidden(true)
            //            .statusBar(hidden: true)
            //            .navigationBarBackButtonHidden(true)
        }
        .onAppear(perform: {
            UINavigationBar.appearance().isHidden = true
        })
    }
}

struct ContactSearchUI_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactSearchUI()
                .previewDevice(PreviewDevice(rawValue: DeviceNames.iPhoneSE))
                .previewDisplayName(DeviceNames.iPhoneSE)
            
            ContactSearchUI()
                .previewDevice(PreviewDevice(rawValue: DeviceNames.iPhone11))
                .previewDisplayName(DeviceNames.iPhone11)
        }
    }
}
