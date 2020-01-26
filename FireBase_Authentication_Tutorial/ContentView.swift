//
//  ContentView.swift
//  FireBase_Authentication_Tutorial
//
//  Created by YOUNGSIC KIM on 2020-01-20.
//  Copyright © 2020 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var emailString = ""
    @State private var password = ""
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    var body: some View {
        VStack {
            
            TextField("Email", text: $emailString).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Button(action: {
                self.addUserToServer()
            }){
                Text("Sign up now")
            }.padding()
                .alert(isPresented: $showAlert) {
                    return Alert(title: Text(alertMessage))
            }
        }
    }
    
    func addUserToServer() {
        Auth.auth().createUser(withEmail: emailString, password: password) { authResult, error in
            
            if error != nil {
                self.alertMessage = error!.localizedDescription
            }else {
                self.alertMessage = "\(authResult!.user.email!) created"
                self.emailString = ""
                self.password = ""
            }
            self.showAlert = true
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
