//
//  ContentView.swift
//  CatWidget
//
//  Created by Yuliya  on 1/13/23.
//

import SwiftUI

let cats = [cat1, cat2, cat3]

struct ContentView: View {
    
    @AppStorage("cat", store: UserDefaults(suiteName: "group.Yuliya-Grygoryeva.CatWidget"))
    var catData: Data = Data()
    var body: some View {
        VStack {
            ForEach(cats) { cat in
                CatView(cat: cat)
                    .onTapGesture {
                        saveToDefaults(cat: cat)
                    }
            }
        }
    }
    
    func saveToDefaults(cat: Cat){
        if let catData = try? JSONEncoder().encode(cat) {
            self.catData = catData
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
