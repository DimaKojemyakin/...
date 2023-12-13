//
//  StartView.swift
//  Universal application
//
//  Created by Дима Кожемякин on 13.12.2023.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var dataSettings: DataSettings
    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        if dataManager.loadData(key: "user")?.isRegistred == true {
            MainView()
        } else {
            RegisterView()
        }
    }
}

#Preview {
    StartView().environmentObject(UserManager()).environmentObject(DataManager())
}
