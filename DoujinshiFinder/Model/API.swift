//
//  API.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import Foundation
import RealmSwift

let Id = "177013"
let search = "Eromanga Sensei"

let url = "https://nhentai.net/api/gallery/\(Id)"
let relatedurl = "https://nhentai.net/api/gallery/\(Id)/related"
let searchurl = "https://nhentai.net/api/galleries/search?query=\(search)"


func URLCreation(with ID: String) {
    print("created")
    let url = "https://nhentai.net/api/gallery/\(ID)"
    let relatedurl = "https://nhentai.net/api/gallery/\(ID)/related"
    
    performRequest(with: url, with: relatedurl)
    
}


func performRequest(with URLString: String,with RelatedString: String) {
    print("STARTING SUCCION")
    if let url = URL(string: URLString) {
        let Session = URLSession(configuration: .default)
        let Task = Session.dataTask(with: url) { (Data, URLResponse, Error) in
            if Error != nil {
                print(Error!)
            } else {
                print("No error")
            }
            if let SafeData = Data {
                print("Parse been called")
                ParseJSON(Data!)
            }
            
            
            //            if let SafeData = Data {
            //                print("First Parse been called")
            //            }
        }
        Task.resume()
    }
}
//    if let Relatedurl = URL(string: RelatedString) {
//        let Session = URLSession(configuration: .default)
//
//        let Task = Session.dataTask(with: Relatedurl) { (Data, URLResponse, Error) in
//            if Error != nil {
//                print(Error!)
//            }
//
//            if let SafeData = Data {
//                RelatedJSON(SafeData)
//                print("second parse called")
//            }
//        }
//        Task.resume()
//    }

//    if let searchurl = URL(string: searchString) {
//        let Session = URLSession(configuration: .default)
//
//        let Task = Session.dataTask(with: searchurl) { (Data, URLResponse, Error) in
//            if Error != nil {
//                print(Error!)
//
//            }
//            if let SafeData = Data {
//                DetailJSON(SafeData)
//            }
//        }
//        Task.resume()
//    }


func ParseJSON(_ data: Data) {
    
    var sauce: Results<Sauce>
    
    let decoder = JSONDecoder()
    
    do {
        let DecodedData = try decoder.decode(MyData.self, from: data)
        let Title = DecodedData.title.english
        let Number = DecodedData.num_pages
        let welp = 0..<DecodedData.tags.count
        var AllTags = List<String>()
        for number in welp {
            let Tags = DecodedData.tags[number].name
            AllTags.append(Tags)
        }
        let ID = DecodedData.id
        
        let newSauce = Sauce()
        newSauce.name = Title
        newSauce.pgs = Number
        newSauce.tags = AllTags
        newSauce.id = ID
        print("Succ assigned the varibles")
        
        print("Beggening to save")
        
        Save(sauce: newSauce)
        
        
        
    } catch {
        print(error)
    }
    
}

//func RelatedJSON(_ data: Data) {
//    let decoder = JSONDecoder()
//
//    do {
//        let DecodedData = try decoder.decode(Response.self, from: data)
//        let welp = 0..<DecodedData.result.count
//        for number in welp {
//            let Title = DecodedData.result[number].title.english
//        }
//
//    } catch {
//        print(error.localizedDescription)
//    }
//
//}

//func DetailJSON(_ data: Data) {
//    let decoder = JSONDecoder()
//
//    do {
//        let DecodedData = try decoder.decode(SearchData.self, from: data)
//        if DecodedData.result.count == 0 {
//            print("No Hentai to match your sick fantasies")
//        }
//        let welp = 0..<DecodedData.result.count
//        for number in welp {
//            let title = DecodedData.result[number].title.english
//            print(title)
//        }
//        print("------------------------")
//
//    } catch {
//        print(error.localizedDescription)
//    }
//
//}

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
