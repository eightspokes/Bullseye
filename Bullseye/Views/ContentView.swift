//
//  ContentView.swift
//  Bullseye
//
//  Created by Roman on 8/30/23.
//

import SwiftUI

struct HitmeButton: View{
    @Binding var game: Game
    @Binding var slidingValue: Double
    @State var showAlert: Bool = false
    @State var earnedPoints: Int = 0
    var body: some View{
        Button{
            earnedPoints = game.calaculateScore(from: Int(slidingValue))
            var temp = game.score
            game.startNewRound(points: temp)
            showAlert = true
        }label: {
            ButtonTextStylingView(text: "Hit me")
                
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Your pick was  \(Int(slidingValue)) Target: \(Int(game.target))"), message: Text("You earned \(earnedPoints)"), dismissButton: .default(Text("Got it!")))
        }
    }
    
}

struct SliderView: View{
    @Binding var speed: Double
    @Binding var isEditing: Bool
    var body: some View{
        Slider(
            value: $speed,
            in: 0...100,
            onEditingChanged: { editing in
                isEditing = editing
            }
        )
    }
}

struct InstructionTextView:  View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color("StrokedTextColor"))
            .kerning(1.0)
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(20)
    }
    
}

struct SliderLabelTextView:  View {
    var text: String
    var body: some View {
        Text(text)
            .font(.body)
            .foregroundColor(Color("StrokedTextColor"))
            .bold()
    }
    
}
struct TargerLabelTextView:  View {
    @Binding var game: Game
    var body: some View {
        Text("\(game.target)")
            .foregroundColor(Color("StrokedTextColor"))
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1.0)
    }
    
}
struct ButtonTextStylingView: View{
    

    var text: String
    var body: some View{
        Text(text.uppercased())
           
            .font(.title3)
            .bold()
            .padding()
            .background(.blue)

            .foregroundColor(.white)
         .overlay(

            RoundedRectangle(cornerRadius: 20)
                
                .strokeBorder(Color.white, lineWidth: 2.0)
            
       

         )
            .cornerRadius(20)
    }
}

struct BackgroundView: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            ForEach(1..<6){ ring in
                let size = ring * 100
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor"), Color.white]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/))
                    .opacity(colorScheme == .dark ? 0.1 : 0.3)
                    .frame(width: CGFloat(size), height: CGFloat(size))
                   
                    
            }
            
        }
    }
}



struct ContentView: View {
    @State private var showAlert = false
    @State private var sliderValue = 50.0
    @State private var isEditing = false
    @State private var game = Game()
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundView()
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                VStack {
                    HStack{
                        Button{
                            game.restart()
                        } label: {
                            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                        }
                       
                        Spacer()
                        Button{
                            
                        } label: {
                            RoundedImageViewFilled(systemName: "list.dash")
                        }
                       
                    }
                    Spacer()
                    InstructionTextView(text: "🎯🎯🎯  \n Put the bulls eye as close as you can to")
                    TargerLabelTextView(game: $game)
                        .padding(.bottom,100)
                  
                    
                     
                    HitmeButton(game: $game, slidingValue: $sliderValue)
                    
                    
                  
                    
                    Spacer()
                    HStack{
                        RoundedIntegerView(label: "SCORE", value: $game.score)
                        Spacer()
                        RoundedIntegerView(label: "ROUND", value: $game.round)
                    }
                }
                HStack {
                    SliderLabelTextView(text: "1")
                        .frame(width:30)
                    SliderView(speed: $sliderValue, isEditing: $isEditing)
                    SliderLabelTextView(text: "100")
                        .frame(width:30)
                }
                .padding()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.device)
            .previewDevice("iPhone 14 Pro Max")
    }
}
