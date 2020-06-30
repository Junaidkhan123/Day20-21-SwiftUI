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
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the Flag of")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        didFlagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                    
                }
                
                Spacer()
                
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("your score is: ???"), dismissButton: .default(Text("OK"), action: {
                self.askQuestion()
            }))
        }
    }
    
    fileprivate func didFlagTapped(_ number : Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
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
