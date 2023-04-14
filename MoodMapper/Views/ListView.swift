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
                        .font(.title)
                        .frame(width: 50, height: 60)
                    
                    TextField("Insert feeling", text: $newDescription)
                    
                    Button(action :{
                        
                        Task {
                            // Write to database
                            try await db!.transaction { core in
                                
                                try core.query("INSERT INTO Feeling (emoji, description) VALUES (?, ?)", newEmoji, newDescription)
                                
                                
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
                List{
                    
                    ForEach(feelings.results){ currentFeeling in
                        
                        HStack{
                            Text(currentFeeling.emoji)
                            Text(currentFeeling.description)
                        }
                        
                    }
                    .onDelete(perform: removeRows)
                    
                }
                
            }
            .padding()
            
            .navigationTitle("Mood Mapper")
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        
        Task{
            
            try await db!.transaction { core in
                
                // Get the ID of the item to be deleted
                var idList = ""
                for offset in offsets {
                    idList += "\(feelings.results[offset].id),"
                }
                
                //Remove the final comma
                print(idList)
                idList.removeLast()
                print(idList)
                
                // Delete the row(s) from the database
                try core.query("DELETE FROM Feeling WHERE id IN (?)", idList)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
