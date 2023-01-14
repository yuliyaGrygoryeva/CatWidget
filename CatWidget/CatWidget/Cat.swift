//
//  Cat.swift
//  CatWidget
//
//  Created by Yuliya  on 1/13/23.
//

import Foundation

struct Cat: Identifiable, Codable {
    
    var id: String {image}
    let image: String
    let name: String
    let realName: String
    
}

let cat1 = Cat(image: "cat1", name: "Purr", realName: "First cat")
let cat2 = Cat(image: "cat2", name: "Meow", realName: "Second cat")
let cat3 = Cat(image: "cat3", name: "Hiss", realName: "Third cat")
