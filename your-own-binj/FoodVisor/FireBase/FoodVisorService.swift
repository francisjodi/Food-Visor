//
//  FoodVisorService.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 23/04/2022.
//

import Firebase
import Foundation
import FirebaseStorage

//renaming this to nathing other than articles disables login
//why?
let COLLECTION_NAME = "users"
let PAGE_LIMIT = 20

enum FoodVisorServiceError: Error {
    case mismatchedDocumentError
    case unexpectedError
}


class FoodVisorService: ObservableObject {
    private var userProfilePhotoUrl : String?
    private let db = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    // Some of the iOS Firebase library’s methods are currently a little…odd.
    // They execute synchronously to return an initial result, but will then
    // attempt to write to the database across the network asynchronously but
    // not in a way that can be checked via try async/await. Instead, a
    // callback function is invoked containing an error _if it happened_.
    // They are almost like functions that return two results, one synchronously
    // and another asynchronously.
    //
    // To deal with this, we have a published variable called `error` which gets
    // set if a callback function comes back with an error. SwiftUI views can
    // access this error and it will update if things change.
    @Published var error: Error?
    @Published var postId: String?

    func createUser(user: FoodVisorUser) -> String {
        
        //save image to db
        saveImage(uniqueName: user.id)
        
        var ref: DocumentReference? = nil
        
        //this will delay everything below here for 10 seconds. This is important so that the userProfilePhoto url of the new image is updated before saving the article
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            ref = self.db.collection(COLLECTION_NAME).addDocument(data: [
                "userName": user.userName,
                "email": user.email,
                "password" : user.password,
                "id": user.id,
                "userProfilePicture": self.userProfilePhotoUrl ?? "https://firebasestorage.googleapis.com/v0/b/mynews-4543f.appspot.com/o/defaultUserPfp.jpg?alt=media&token=86c5cc96-3811-4d3e-af14-3a23f178c0b5",
            ]) { possibleError in
                if let actualError = possibleError {
                    self.error = actualError
                }
            }
            //get the post id to use in uploading the video
            self.postId = ref?.documentID ?? ""
        }

        // If we don’t get a ref back, return an empty string to indicate “no ID.”
        return ref?.documentID ?? ""
    }

    //gets the requested user
    func fetchUser(email: String, password: String) {
        
    }
    
    //fetches the events this user is attending/created? for the current user only
    func fetchUserEvents(userId: String?)  {
       
    }
    
    //saves pictures to the database
    func saveImage(uniqueName: String) {

        if let imageData = UserDefaults.standard.value(forKey: "userPfp") as? Data {
            storage.child("foodVisorUserPics/file\(uniqueName).png").putData(imageData, metadata: nil, completion: {_, error in
                guard error == nil else {
                    debugPrint("failed to upload to firestore. Error returned: \(error)")
                    return
                }
                
                self.storage.child("images/file\(uniqueName).png").downloadURL(completion: { [self]url, error in
                    guard url == url, error == nil else {
                        return
                    }
                    
                    let urlString = url!.absoluteString
                    self.userProfilePhotoUrl = urlString
                    UserDefaults.standard.synchronize()
                    //rem0ve picture
                      UserDefaults.standard.removeObject(forKey: "userPfp")
                })
            })
        //if there is no picture to save, return
        } else {
            userProfilePhotoUrl = "https://firebasestorage.googleapis.com/v0/b/mynews-4543f.appspot.com/o/Breaking%20News%20Default.001.jpg?alt=media&token=663d63e9-d810-4369-a27a-30bf9c647e4e"
            debugPrint("it retunred on empty pic")
            return
        }
    }
}



