//
//  AddUserPicture.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import SwiftUI

import SwiftUI

//prompts user to add a profile picture
struct AddUserPicture: View {
    
    @State var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    Text("Profile picture")
                    image?
                        .resizable()
                        .scaledToFill()
                        .scaledToFit()
                        .cornerRadius(200)
                        .frame(width: 440, height: 440)

                }
                .onTapGesture {
                    showingImagePicker = true
                }
            }
            .onChange(of: inputImage) {_ in loadImage() }
            .frame(width: 300, height: 300)
            .cornerRadius(200)
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
        }

        }
        

    }
    
    //loads the image after one is selected
    func loadImage() {
        guard let inputImage = inputImage else { return}
        image = Image(uiImage: inputImage)
    }
    
}

struct AddUserPicture_Previews: PreviewProvider {
    static var previews: some View {
        AddUserPicture()
    }
}

