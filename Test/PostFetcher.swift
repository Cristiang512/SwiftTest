//
//  PostFetcher.swift
//  Test
//
//  Created by Cristian Gilberto Gutierrez Puerto on 26/07/22.
//

import Foundation
import SwiftUI

//"userId": 1,
//  "id": 1,
//  "title": "delectus aut autem",
//  "completed": false
//},

struct Post: Identifiable, Decodable{
    
    let userId: Int
    let id: String
    let title: String
    let body: String
    
}



class PostFetcher: ObservableObject{
    
    init() {
        networking()
    }
    
    @Published var posts = [Post]()
    
    
        
        func networking() {
            
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                do {
                    
                    let tempPosts = try JSONDecoder().self.decode([Post].self, from: data!)
                    DispatchQueue.main.async {
                        self.posts = tempPosts
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }.resume()
            
        
        }
    
}
