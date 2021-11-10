//
//  model.swift
//  Rick
//
//  Created by Gustavo Fidencio on 05/11/21.
//

struct Location : Decodable{
    let url : String
    let name : String
}

struct Origin : Decodable{
    let url : String
    let name : String
}

struct Character : Decodable{
    let id : Int
    let url : String
    let name : String
    let type : String
    let image : String
    let status : String
    let gender : String
    let origin : Origin
    let species : String
    let created : String
    let episode : [String]
    let location : Location
}

struct Info : Decodable{
    let count : Int
    let pages : Int
    let next : String
    let prev : String?
}

struct Model : Decodable{
    let info : Info
    let results : [Character]
}
