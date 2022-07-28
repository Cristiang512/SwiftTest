//
//  LaunchDataFetcher.swift
//  Test
//
//  Created by Cristian Gilberto Gutierrez Puerto on 26/07/22.
//

import Foundation
import SwiftUI
import Combine

struct launch: Codable {
    public var userId: Int
    public var id: Int
    public var title: String
    public var body: String
}

extension launch: Identifiable {
    var Id: Int { return userId }
}

public class LaunchDataFetcher: ObservableObject {

    @Published var launches = [launch]()

    init(){
        load()
    }

    func load() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([launch].self, from: d)
                    DispatchQueue.main.async {
                        print(decodedLists)
                        self.launches = decodedLists
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

