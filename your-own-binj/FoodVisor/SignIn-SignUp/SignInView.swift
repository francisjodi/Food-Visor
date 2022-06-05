//
//  SignInView.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            List {
                Section("") {
                    TextField("email", text: $email)
                }
                Section("") {
                    TextField("password", text: $password)
                }
            }
            .navigationTitle("Sign In ")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        //button currently malfunctioning
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Sign In") {
                    }
                    //will need a way to inform user if they have no account yet or have entered incorrect password
                    .disabled((password.isEmpty || email.isEmpty))
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
