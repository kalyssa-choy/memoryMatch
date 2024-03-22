//
//  game.swift
//  memoryMatch
//
//  Created by StudentAM on 3/13/24.
//

import SwiftUI

struct GamePage: View{
    
//array that keeps track of the cards
@State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)

//all of the emojis that can be used
@State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄"].shuffled() //shuffles the array

    //formatting the columns and how the cards will be displayed
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]

//keeps track of the index first pick
@State private var pickOne:Int = -1

//keeps track of the index of the second pick
@State private var pickTwo:Int = -1

//keeps track of the score
@State private var score: Int = 0

//keeps track of if the game has been completed
@State private var gameFinished: Bool = false
    
    var body: some View{
        //navigation view allows for links to go between pages
        NavigationView{
            
            //for formatting and the background
            ZStack{
                //pink circle
                Circle()
                    //styling
                    .position(x: 40, y: 30)
                    .foregroundColor(Color("lightPink"))
                
                //green circle
                Circle()
                    //styling
                    .position(x: 350, y: 700)
                    .foregroundColor(Color("lightGreen"))
                
                //the actual display/game display
                VStack{
                    
                    //displays the number of matches the user has
                    Text("Current Score: \(score)")
                        //styling
                        .padding()
                        .font(.system(size: 40, weight: .heavy))
                    
                    //lays out the cards for the games
                    LazyVGrid(columns: columns) {
                        //iterates through all emojis and creates a card for all
                        ForEach(emojis.indices, id: \.self){index in
                            Button(action: {cardTapped(index: index)}, label: {
                                cardView(isFlipped: cardsFlipped[index], emoji: emojis[index])
                            })
                        }
                    }
                    
                    //checks if the game is still in progress or not
                    if gameFinished{
                        //HStack for formatting and making sure the buttons are next to eachother
                        HStack{
                            //creates a link to the next page
                            NavigationLink(destination: EndPage().navigationBarBackButtonHidden(true), label: {
                                    //displayed text
                                    Text("Next")
                                    //styling
                                    .frame(width: 100, height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .font(.system(size: 26, weight: .heavy))
                                    .padding(10)

                            })
                            
                            //creates link to restart the game page for a new game
                            NavigationLink(destination: GamePage().navigationBarBackButtonHidden(true), label: {
                                    //displayed text
                                    Text("Retry")
                                        //styling
                                        .frame(width: 100, height: 50)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .font(.system(size: 26, weight: .heavy))
                                        .padding(10)

                            })
                        }
                        
                    }
                }
            }
        }
    }
    
    //function that compares the picks to eachother
    func cardTapped(index:Int){
        //checks if pickOne has been chosen or not (valid index)
        if pickOne == -1{
            //checks if the card has already been chosen
            if cardsFlipped[index] == false{
                //assigns pickOne to the index
                pickOne = index
                //flips the card
                cardsFlipped[index] = true
            }
            
        }
        
        //checks if pickTwo has been chosen and ensures it isn't the same card as pickOne (probably unecessary because it also checks if the flipped is false but whatever)
        else if pickTwo == -1 && index != pickOne{
            //ensures the user is not choosing a card that has already been flipped
            if cardsFlipped[index] == false{
                //assigns the index to pickTwo
                pickTwo = index
                //flips the card
                cardsFlipped[index] = true
                
                //compares pickOne to pickTwo
                if emojis[pickOne] == emojis[pickTwo]{
                    //adds 1 to the score if they are the same
                    //resets pickOne and pickTwo values
                    score += 1
                    pickOne = -1
                    pickTwo = -1
                }
                //if they are not a match
                else{
                        //delays the flipping of the card
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
                        //resets all cards and all picks
                        cardsFlipped[pickOne] = false
                        cardsFlipped[pickTwo] = false
                        pickOne = -1
                        pickTwo = -1
                    }
                   
                }
            }
        }
        
        //checks if the came is over/all matches have been found
        if score == emojis.count/2{
            //ends the game
            gameFinished = true
        }
    }

}

struct gamePreview: PreviewProvider {
  static var previews: some View{
      GamePage()
  }
}

