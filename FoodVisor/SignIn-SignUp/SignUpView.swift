//
//  SignUpView.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @State var userName = ""
    @State var confirmPassword = ""
    @EnvironmentObject var foodVisorService: FoodVisorService
    
    var body: some View {
        NavigationView {
            List {
                AddUserPicture()
                Section(header: Text("")) {
                    TextField("user name", text: $userName)
                }
                
                //will need a way to tell user IF entered text is not a valid email
                Section(header: Text("")) {
                    TextField("email", text: $email)
                }
                
                Section(header: Text("")) {
                    TextField("password", text: $password)
                }
                
                Section(header: Text("")) {
                    TextField("confirm password", text: $confirmPassword)
                }

            }
            .navigationTitle("Sign Up")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        createUser()
                    }
                    //will need a way to inform user passwords do not match
                    .disabled((password.isEmpty || confirmPassword.isEmpty) || (password != confirmPassword))
                }
            }
        }
    }
    
    func createUser() {
        // We take a two-part approach here: this first part sends the article to
        // the database. The `createArticle` function gives us its ID.
        let userId = foodVisorService.createUser(user: FoodVisorUser(
            id: UUID().uuidString,
            email: email,
            password: confirmPassword,
            userName: userName,
            profilePictureUrl: UserDefaults.standard.value(forKey: "currentPhotoUrl") as? String ?? "https://firebasestorage.googleapis.com/v0/b/mynews-4543f.appspot.com/o/Breaking%20News%20Default.001.jpg?alt=media&token=663d63e9-d810-4369-a27a-30bf9c647e4e"
            
        ))
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(FoodVisorService())
    }
}
