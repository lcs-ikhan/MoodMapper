//
//  ContentView.swift
//  MoodMapper
//
//  Created by Isaad Khan on 2023-04-06.
//

import Blackbird
import SwiftUI

struct ListView: View {
    
    // Access the connection to the database (needed to add a new record)
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @BlackbirdLiveModels({ db in
        try await Feeling.read(from: db)
    }) var feelings
    
    @State var newEmoji: String = ""
    
    @State var newDescription: String = ""
    var body: some View {
        NavigationView{
            VStack {
                Text("How do you feel?")
                
                HStack{
                    TextField("Emoji", text: $newEmoji)
                        .frame(width: 50, height: 60)
                    
                    TextField("Insert feeling", text: $newDescription)
                    
                    Button(action :{
                        
                        Task {
                            // Write to database
                            try await db!.transaction { core in
                                
                                try core.query("INSERT INTO Feeling (emoji) VALUES (?)", newEmoji)
                                
                                try core.query("INSERT INTO Feeling (description) VALUES (?)", newDescription)
                            }
                            
                            // Clear the input field
                            newEmoji = ""
                            
                            newDescription = ""
                        }
                        
                    }, label : {
                        Text("ADD")
                            .font(.caption)
                    })
                }
                
                List (feelings.results){ currentFeeling in
                    
                    HStack{
                        Text(currentFeeling.emoji)
                        Text(currentFeeling.description)
                    }
                    
                }
            }
            .padding()
            
            .navigationTitle("Mood Mapper")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
