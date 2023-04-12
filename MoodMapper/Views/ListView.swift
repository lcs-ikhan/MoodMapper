//
//  ContentView.swift
//  MoodMapper
//
//  Created by Isaad Khan on 2023-04-06.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("How do you feel?")
                
                HStack{
                    TextField("Emoji", text: Binding.constant(""))
                        .frame(width: 50, height: 60)
                    
                    TextField("Insert feeling", text: Binding.constant(""))
                    
                    Button(action :{
                        
                    }, label : {
                        Text("ADD")
                            .font(.caption)
                    })
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
