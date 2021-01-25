//
//  ContactUI.swift
//  SlideMenuApp
//
//  Created by Muhammad Riaz on 28/12/2020.
//

import SwiftUI
import MapKit

struct ContactUI: View {
    
    @State private var isActive = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        NavigationView {
            VStack {
                Color.red
                NavigationLink(destination: ContactSearchUI(),
                               isActive: $isActive) {
                    Button(action: {
                        self.isActive = true
                    }) {
                        Text("Push Next View")
                    }
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
        //        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContactUI_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactUI()
                .previewDevice(PreviewDevice(rawValue: DeviceNames.iPhoneSE))
                .previewDisplayName(DeviceNames.iPhoneSE)
            
            ContactUI()
                .previewDevice(PreviewDevice(rawValue: DeviceNames.iPhone11))
                .previewDisplayName(DeviceNames.iPhone11)
        }
    }
}
