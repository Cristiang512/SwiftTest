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
                            HStack(){
                                Image(systemName: "doc.plaintext")
                                    .padding()
                                Text(launch.title)
                                    .font(.system(size: 15))
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        HStack {
                            Image(systemName: "figure.walk").foregroundColor(.black).font(.title)
                            Image(systemName: "figure.walk").foregroundColor(.black).font(.title)
                            Image(systemName: "figure.walk").foregroundColor(.black).font(.title)
                            Image(systemName: "figure.walk").foregroundColor(.black).font(.title)
                            Image(systemName: "figure.walk").foregroundColor(.black).font(.title)
                            Image(systemName: "figure.walk").foregroundColor(.black).font(.title)
                            Image(systemName: "figure.walk").foregroundColor(.black).font(.title)
                        }
                    }
                }
                .navigationTitle("Post's")
                
                .background(Color.purple.ignoresSafeArea())
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .navigationBarTitleDisplayMode(.large)
                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                HStack {
                                    Image(systemName: "arrow.up")
                                    Image(systemName: "arrow.up")
                                    Image(systemName: "arrow.up")
                                }
                            }
                        }
            }
            .environment(\.colorScheme, .dark)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

