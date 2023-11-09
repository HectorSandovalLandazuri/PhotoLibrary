//
//  CircleView.swift
//  FriendFace
//
//  Created by Héctor Manuel Sandoval Landázuri on 09/11/23.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Circle()
        .fill(Color.blue)
        .opacity(0.3)
        .frame(width: 32, height: 32)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
