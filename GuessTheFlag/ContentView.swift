//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Caden Huffman on 7/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France","US","UK","Spain","Russia","Poland", "Nigeria","Italy","Ireland","Germany"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack{
            //LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                //.ignoresSafeArea()
                                                    
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing:15){
                    VStack{
                        Text("Tap the Flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label:{
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 10)
                        }
                    }
                }
                
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: ???")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            
            .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is ???")
            }

        }
    }
    func flagTapped(_ number:Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
