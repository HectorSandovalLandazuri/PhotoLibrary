//
//  ContentView.swift
//  FriendFace
//
//  Created by Héctor Manuel Sandoval Landázuri on 09/11/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingEditPictureView = false
    @State private var pictures = [Picture]()
    
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pictures) { picture in
                    NavigationLink(destination: DetailView(picture: picture)) {
                        Text(picture.pictureName)
                    }
                    
                }.onDelete(perform: removeItems(at:))
            }
                
            .navigationBarTitle(Text("Photo Album"))
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingEditPictureView = true
                
            }, label: {
                Image(systemName: "plus")
            }))
                .sheet(isPresented: $showingEditPictureView, onDismiss: nil) {
                    EditPictureView(pictures: self.$pictures)
                    
            }
            .onAppear {
                self.pictures =  ManageData.loadPictures(pathName: "Pictures")
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        let image = pictures[offsets.first!]
        print(image.pictureName)
        
        ManageData.removeImage(pathName: image.id.uuidString)
        pictures.remove(atOffsets: offsets)
        
        ManageData.savedPictures(pathName: "Pictures", pictures: self.pictures)
    }
    
}


#Preview {
    ContentView()
}
