//
//  Picture.swift
//  FriendFace
//
//  Created by Héctor Manuel Sandoval Landázuri on 09/11/23.
//

import Foundation

struct Picture: Codable, Identifiable {
    var id: UUID
    var pictureName: String
    var locations: [CodableMKPointAnnotation]
    
    }
