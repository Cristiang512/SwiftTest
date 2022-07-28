//
//  LaunchDataFetcherComments.swift
//  Test
//
//  Created by Cristian Gilberto Gutierrez Puerto on 27/07/22.
//

import Foundation
import SwiftUI

struct launchComment: Codable {
    public var postId: Int
    public var id: Int
    public var name: String
    public var email: String
    public var body: String
    
}

extension launchComment: Identifiable {
    var Id: Int { return postId }
}

public class LaunchDataFetcherComments: ObservableObject {
    
    @Published var userId: Int
    @Published var launchesComments = [launchComment]()

    init(userId: Int){
        self.userId = userId
        load()
    }

    func load() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([launchComment].self, from: d)
                    DispatchQueue.main.async {
                        print(decodedLists)
                        self.launchesComments = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch let parsingError {
                print ("Error", parsingError)
            }

        }.resume()
    }
}
