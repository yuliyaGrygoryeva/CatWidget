//
//  CatView.swift
//  CatWidget
//
//  Created by Yuliya  on 1/13/23.
//

import SwiftUI

struct CatView: View {
    
    let cat: Cat
    
    var body: some View {
        HStack{
            CircularImageView(image: Image(cat.image))
                .frame(width: 100, height: 100, alignment: .center)
                .padding(50)
            Spacer()
            VStack {
                Text(cat.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                Text(cat.realName)
                    .fontWeight(.bold)
                
            }.padding()
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView(cat: cat1)
    }
}
