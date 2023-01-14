//
//  ContentView.swift
//  CatWidget
//
//  Created by Yuliya  on 1/13/23.
//

import SwiftUI

let cats = [cat1, cat2, cat3]

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(cats) { cat in
                CatView(cat: cat)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
