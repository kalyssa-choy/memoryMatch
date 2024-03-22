//
//  EndPage.swift
//  memoryMatch
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct EndPage: View {
    
    var body: some View {
        //navigation view to allow for links
        NavigationView{
            //to create the background
            ZStack{
                //pink circle
                Circle()
                    .position(x: 40, y: 30)
                    .foregroundColor(Color("lightPink"))
                
                //green circle
                Circle()
                    .position(x: 350, y: 700)
                    .foregroundColor(Color("lightGreen"))
                
                //putting text on the screen
                VStack{
                    //emoji
                    Text("😃")
                        .font(.system(size: 150))
                        .padding(5)
                    
                    //end message
                    Text("Great Job!")
                        .font(.system(size:40))
                    
                    //link to go back to the game page
                    NavigationLink(destination: GamePage().navigationBarBackButtonHidden(true), label:{
                        //displayed text
                        Text("Play Again")
                        //styling
                            .frame(width: 200, height: 80)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .font(.system(size: 30, weight: .heavy))
                            .padding(20)
                    })
                }
                
            }
            
            
        }
        
    }
}

#Preview {
    EndPage()
}
