//
//  Universal_applicationApp.swift
//  Universal application
//
//  Created by Дима Кожемякин on 13.12.2023.
//

import SwiftUI

@main
struct Universal_applicationApp: App {
    @StateObject var userManager = UserManager()
    @StateObject var dataSettings = DataSettings()
    @StateObject var dataManager = DataManager()

    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(userManager)
                .environmentObject(dataManager)
                .environmentObject(dataSettings)
                .onAppear {
                    // Загрузка данных из UserDefaults и установка их в userManager
                    if let loadedUser = dataManager.loadData(key: "user") {
                        userManager.user = loadedUser
                    }
                }
        }
    }
}
