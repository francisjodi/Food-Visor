//
//  SignUpButton.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

struct SignUpButton: View {
    
    @State private var presentSignUp = false

    var body: some View {
        Button("Sign Up") {
            presentSignUp.toggle()
        }
        .background(
            Image("IMG_0331")
        )
        .frame(width: 180, height: 80)
        .background(.black)
        .cornerRadius(200)
        .foregroundColor(.black)
        .font(.headline)
        .sheet(isPresented: $presentSignUp) {
            SignUpView()
        }
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton()
            .environmentObject(FoodVisorService())
    }
}
