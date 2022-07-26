//
//  ListDetailView.swift
//  Test
//
//  Created by Cristian Gilberto Gutierrez Puerto on 26/07/22.
//

import SwiftUI

struct ListDetailView: View {
    
    var launch: launch
    
    var body: some View {
        VStack{
            
            Text(launch.title).font(.largeTitle)
            Text(launch.completed ? "Completed" : "Pending").font(.title)
                .foregroundColor(Color.blue)
            Spacer()

        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(launch: launch(userId: 1, id: 1, title: "Cristian                 Gutierrez" , completed: true))
    }
}

