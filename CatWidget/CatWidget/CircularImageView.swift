//
//  CircularImageView.swift
//  CatWidget
//
//  Created by Yuliya  on 1/13/23.
//

import SwiftUI

struct CircularImageView: View {
    
    var image: Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(Color
                    .indigo, lineWidth: 10))
                .shadow(radius: 15)
                .padding()
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("cat1"))
    }
}
