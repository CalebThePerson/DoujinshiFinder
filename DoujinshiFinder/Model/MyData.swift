//
//  MyData.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/27/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import Foundation

struct MyData: Codable {
    let id : Int
    let title: Title
    let num_pages: Int
    let tags: [Tags]
    
}

struct Title: Codable {
    let english : String
    let japanese : String
}

struct NumOfPages: Codable{
    let num_pages: Int
}

struct Tags: Codable {
    let name: String
}

struct Result: Codable {
    let title: Title
}

struct Response: Codable {
    let result : [Result]
}

struct SearchData: Codable {
    let result : [Result]
}
