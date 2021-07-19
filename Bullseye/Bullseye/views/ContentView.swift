//
//  ContentView.swift
//  Bullseye
//
//  Created by user on 7/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue =  80.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT BULLSEYEAS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
                HStack {
                    Text("1")
                        .bold()
                        .font(.title3)
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .font(.title3)
                }
            Button(action: {
                alertIsVisible = true
            })
            {
                Text("Hit me")
            } 
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int (sliderValue.rounded())
                return Alert(
                    title: Text("Hello"),
                    message: Text("The sliders's value is \(roundedValue).\n" + "Your score \(game.points(sliderValue: roundedValue)) points this round"),
                    dismissButton: .default(Text("Start new round")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
