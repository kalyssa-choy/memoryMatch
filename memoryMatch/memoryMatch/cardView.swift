//
//  cardView.swift
//  memoryMatch
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct cardView: View {
    
    //boolean for checking if the card is supposed to show the emoji
    var isFlipped: Bool
    //the emoji that the card is covering
    var emoji: String
    
    var body: some View {
        
        //to stack the card on top of the emoji
        ZStack{
            //creating the box covering the emoji
            Rectangle()
            //styling
            //ternary operator to check if the square should be covering the emoji
                .fill(isFlipped ? Color.clear : Color.blue)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            
            //checks if the emoji should be displayed
            if isFlipped{
                //the emoji
                Text("\(emoji)")
                    //styling
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    //starting card
    cardView(isFlipped: false, emoji: "😀")
}
