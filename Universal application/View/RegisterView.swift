//
//  RegisterView.swift
//  Universal application
//
//  Created by Дима Кожемякин on 13.12.2023.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var dataManager: DataManager
    @State private var user: UserManager?
    @State private var isActiveAlert = false

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Login")
                Spacer()
            }
            TextFields(userName: $userManager.user.userName)
            HStack {
                Text("Password")
                Spacer()
            }
            TextFields(userName: $userManager.user.userPassword)
            Button(action: {registerView()  }  ){
                Text("Done").foregroundColor(.white)
            }.buttonStyle(BorderedButtonStyle()).background(Color.blue).cornerRadius(10).alert(isPresented: $isActiveAlert) {
                Alert(title: Text("Erorr"), message: Text("Pleas enter your given"))
            }
            Spacer()
            
        }.padding()
    }
}
extension RegisterView {
    func registerView() {
        if !userManager.user.userName.isEmpty {
            userManager.user.isRegistred = true
            dataManager.saveData(user: userManager.user, key: "user")
            print(dataManager.loadData(key: "user")!)
        } else {
            isActiveAlert.toggle()
        }
    }
}

struct TextFields: View {
    @Binding var userName: String

    var body: some View {
        VStack{
            TextField("Enter your login", text: $userName).textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    RegisterView().environmentObject(UserManager()).environmentObject(DataManager())
}
