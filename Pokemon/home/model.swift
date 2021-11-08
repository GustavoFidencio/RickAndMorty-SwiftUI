//
//  model.swift
//  Pokemon
//
//  Created by Gustavo Fidencio on 05/11/21.
//
//
//struct Model : Decodable{
//    let id : Int
//    let userId: Int
//    let title : String
//    let completed : Bool
//}

struct BasicPoke : Decodable {
    let name : String
    let url : String
}


struct Model : Decodable{
    let count : Int
    let next: String
    let previous : String
    let results : [BasicPoke]
}
