//
//  SignInOrSignUp.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

struct SignInOrSignUp: View {
    var body: some View {
        ZStack {
            Text("FoodVisor 🥯")
                .font(.headline)
                .foregroundColor(.red)
                .fontWeight(.heavy)
                .shadow(color: .yellow, radius: 10)
                .offset(y: -150)
            HStack {
                SignInButton()
                    .offset(x:-2,y:0)
                SignUpButton()
            }
            
        }
    }
}

struct SignInOrSignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignInOrSignUp()
            .environmentObject(FoodVisorService())
    }
}
