//
//  ListDetailView.swift
//  Test
//
//  Created by Cristian Gilberto Gutierrez Puerto on 26/07/22.
//

import SwiftUI

struct ListDetailView: View {
    
    var launch: launch
    
    @ObservedObject var fetcherComment = LaunchDataFetcherComments(userId: 1)
    
    
    
    var body: some View {
            VStack{
                ScrollView{
                Text("Details")
                    .font(.largeTitle).fontWeight(.bold)
                Spacer().frame(height: 20)
                Text(launch.title).font(.title)
                        .foregroundColor(Color.blue)
                Spacer().frame(height: 15)
                Text(launch.body).font(.headline)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Courier", size: 80))
                Spacer()
                Text("Comments")
                    .font(.largeTitle).fontWeight(.bold)
                }
                List(fetcherComment.launchesComments) { launchComment in
                    HStack(){
                        Image(systemName: "person")
                            .padding(5)
                        Text("Name").foregroundColor(Color.blue)
                    }
                    HStack(){
                        Image(systemName: "checkmark")
                            .padding(1)
                            .foregroundColor(.blue)
                        Text(launchComment.name)
                    }
                    
                    HStack(){
                        Image(systemName: "mail")
                            .padding(5)
                        Text("E-mail").foregroundColor(Color.blue)
                    }
                    HStack(){
                        Image(systemName: "checkmark")
                            .padding(1)
                            .foregroundColor(.blue)
                        Text(launchComment.email)
                    }
                    
                    HStack(){
                        Image(systemName: "text.justify")
                            .padding(5)
                        Text("Body").foregroundColor(Color.blue)
                    }
                    HStack(){
                        Image(systemName: "checkmark")
                            .padding(1)
                            .foregroundColor(.blue)
                        Text(launchComment.body)
                    }
                }
                .background(Color.blue.ignoresSafeArea())
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                Spacer()
            }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(launch: launch(userId: 1, id: 1, title: "Cristian                 Gutierrez" , body: "Swift")
        )
    }
}
