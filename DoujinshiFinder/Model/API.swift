//
//  API.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

//THE API FILe

import Foundation
import RealmSwift

//Future and testing Constant
//let relatedurl = "https://nhentai.net/api/gallery/\(Id)/related"
//let searchurl = "https://nhentai.net/api/galleries/search?query=\(search)"


protocol SauceDelegate {
    func NoSauceAlert()
}


//Creates the URl and then calls perform request

struct FindSauce {
    
    var Delegate: SauceDelegate?
    
    
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
                    self.ParseJSON(Data!)
                }
                
                
            }
            Task.resume()
        }
    }
    
    
    
    func ParseJSON(_ data: Data) {
        
        var sauce: Results<Sauce>
        
        let decoder = JSONDecoder()
        
        do {
            let DecodedData = try decoder.decode(MyData.self, from: data)
            let Title = DecodedData.title.english
            let Number = DecodedData.num_pages
            let welp = 0..<DecodedData.tags.count
            var AllTags = List<String>()
            
            
            
            
            let ID = DecodedData.id
            
            let newSauce = Sauce()
            
            newSauce.name = Title
            newSauce.pgs = Number
            newSauce.id = ID
            print("Assinged the first few things")
            
            for number in welp {
                let SauceTags = NiceTags()
                let Tags = DecodedData.tags[number].name
                SauceTags.tags = Tags
                newSauce.tags.append(SauceTags)
                
            }
            DispatchQueue.main.async {
                Save(sauce: newSauce)
                
            }
            
        } catch {
            print(error)
            DispatchQueue.main.async {
                self.Delegate?.NoSauceAlert()
                
            }
        }
    }
}






//MARK: - Commetn Section
//Things that may be useful for me later

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

//        print("Beggingn this hell hole we call saving ")
//        DispatchQueue.main.async {
//            do {
//                print("Writing")
//                try realm.write {
//
//                    let ID = DecodedData.id
//
//                    let newSauce = Sauce()
//                    newSauce.name = Title
//                    newSauce.pgs = Number
//                    //        newSauce.tags = AllTags
//                    newSauce.id = ID
//                    print("Assinged the first few things")
//                    let ParentSauce = newSauce
//
//                    for number in welp {
//                        let SauceTags = NiceTags()
//                        let Tags = DecodedData.tags[number].name
//                        SauceTags.tags = Tags
//                        newSauce.tags.append(SauceTags)
//
//                    }
//                    print("Tags assigned")
//                }
//            } catch {
//                print(error)
//            }
//
//        }
//    } catch {
//        print(error)
//    }

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

