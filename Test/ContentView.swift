//
//  ContentView.swift
//  Test
//
//  Created by Cristian Gilberto Gutierrez Puerto on 26/07/22.
//

import Foundation
import SwiftUI


struct ContentView: View {
    @ObservedObject var fetcher = LaunchDataFetcher()

    var body: some View {
        NavigationView{
            List(fetcher.launches) { launch in
                NavigationLink(destination: ListDetailView(launch: launch)){
                    VStack (alignment: .leading) {
                        Text(launch.title)

                        Text(launch.completed ? "Completed" : "Pending")
                            .font(.system(size: 11))
                            .foregroundColor(Color.gray)
                    }
                }
            }
            .navigationTitle("Todo's")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

