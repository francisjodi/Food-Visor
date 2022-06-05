//
//  ContentView.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignInOrSignUp()
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FoodVisorService())
    }
}
