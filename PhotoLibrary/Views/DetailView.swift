//
//  DetailView.swift
//  FriendFace
//
//  Created by Héctor Manuel Sandoval Landázuri on 09/11/23.
//

import SwiftUI
import MapKit


struct DetailView: View {
    
    var picture:  Picture
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    
    
    var body: some View {
        
        VStack {
            DrawImageNameView(text: "Photo name: ", textResults: picture.pictureName)
            
            if image != nil {
                image?
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            } else {
                Text("Image not found")
            }
            ZStack {
                MapView(centerCoordinate:  $centerCoordinate, annotations: picture.locations)
                .cornerRadius(20)
            }
            Spacer()
        }
        .onAppear {
            self.loadImage()
        }
    }
    
    func loadImage() {
        let data = ManageData.loadImage(pathName: picture.id.uuidString)
        guard  let loadedData = data else {
            return
        }
        self.inputImage =  UIImage(data: loadedData)
        self.image = Image(uiImage: inputImage!)
    }
    
}
