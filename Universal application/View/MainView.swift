//
//  MainView.swift
//  Universal application
//
//  Created by Дима Кожемякин on 13.12.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var dataSettings: DataSettings
    @EnvironmentObject var dataManager: DataManager
    
    @State private var isActiveSheetSettings = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
            }
            .navigationTitle("Main view")
            .navigationBarItems(leading:
                                    HStack{
                Button(action: { isActiveSheetSettings.toggle() } ){
                    Image(systemName: "gearshape")
                }
            }
            )
            .sheet(isPresented: $isActiveSheetSettings) {
                Settings()
            }
        }
        
    }
}

#Preview {
    MainView().environmentObject(UserManager()).environmentObject(DataManager()).environmentObject(DataSettings())
}
