//
//  ContentView.swift
//  Day20-21- SwiftUI
//
//  Created by Jhon Khan on 30/06/2020.
//

import SwiftUI

struct ContentView: View {
    @State  private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State  private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    @State private var flagValue   = ""
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the Flag of")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 220, height: 130)
                        .cornerRadius(10)
                        .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                        .overlay(
                            Button(action: {
                                didFlagTapped(number)
                            }){
                                Image(self.countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            }

                        )
                        
                                        
                }
                Text("Current Score:\(totalScore)")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                Spacer()
                
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Thats the Flag of: \(flagValue)"), dismissButton: .default(Text("OK"), action: {
            }))
        }
    }
    
    fileprivate func didFlagTapped(_ number : Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            totalScore += 1
        } else {
            scoreTitle = "Wrong"
            totalScore -= 1
            flagValue   = countries[number]
            showingScore = true
        }
        self.askQuestion()

    }
    
    fileprivate func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
