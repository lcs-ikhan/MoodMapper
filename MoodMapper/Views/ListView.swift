//
//  ContentView.swift
//  MoodMapper
//
//  Created by Isaad Khan on 2023-04-06.
//

import SwiftUI

struct ListView: View {
    
    @State var feelings: [Feeling] = existingFeelings
    
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
                        
                        // Get last todo item id
                        let lastId = feelings.last!.id
                        
                        // Create new todo item id
                        let newId = lastId + 1
                        
                        // Create the new todo item
                        let newFeeling =  Feeling(id: newId, emoji: newEmoji, description: newDescription)
                        
                        // Add the new to-do item to the list
                        feelings.append(newFeeling)
                        
                        // Clear the input field
                        newEmoji = ""
                        
                        newDescription = ""
                        
                    }, label : {
                        Text("ADD")
                            .font(.caption)
                    })
                }
                
                List (feelings){ currentFeeling in   
                    
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
