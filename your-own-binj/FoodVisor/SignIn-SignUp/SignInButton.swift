//
//  SignInButton.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

struct SignInButton: View {
    
    @State private var presentSignIn = false
    
    var body: some View {
        Button("Sign In") {
            presentSignIn.toggle()
        }
        .background(
            Image("IMG_0330-1")
        )
        .frame(width: 180, height: 80)
        .background(.black)
        .cornerRadius(200)
        .foregroundColor(.yellow)
        .font(.headline)
        .sheet(isPresented: $presentSignIn) {
            SignInView()
        }
    }
}

struct SignInButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInButton()
    }
}
