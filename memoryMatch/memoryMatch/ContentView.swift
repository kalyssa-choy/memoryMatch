//
//  ContentView.swift
//  memoryMatch
//
//  Created by StudentAM on 3/13/24.
//

import SwiftUI

struct ContentView: View {
                                
    var body: some View {
        
        //navigation vew to allow linking to other pages
        NavigationView {
            //to put the background image in
            ZStack{
                
                //the background
                Image("homePageBackground")
                
                //vstack for placing the title and the navigation link
                VStack{
                    //the title
                    Text("EmojiMatch")
                    //attempting to style the font with custom
//                        .bold()
//                        .font(.custom("MadimiOne-Regular", size: 36))
                    //styling
                        .font(.system(size: 36, weight: .heavy))
                        .frame(width: 250, height: 80)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(100)
                        
                        
                    //the start "button" that takes user to the game
                    NavigationLink(destination: GamePage().navigationBarBackButtonHidden(true), label: {
                        //the text
                        Text("Start")
                            //styling
                            .frame(width: 150, height: 80)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .font(.system(size: 36, weight: .heavy))
                            .padding(150)
                    })
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
