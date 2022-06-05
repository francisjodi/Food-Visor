//
//  ImagePicker.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 21/04/2022.
//

import Foundation
import PhotosUI
import SwiftUI

//code adopted from hacking with swift: https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-phpickerviewcontroller

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        //picker can load any of these
        config.filter = PHPickerFilter.any(of: [.images, .livePhotos, .videos])
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                    guard let imageData = self.parent.image!.pngData() else {return}
                    UserDefaults.standard.set(imageData,forKey: "userPfp")
                    UserDefaults.standard.synchronize()
                }
           }
       }
    }
}

