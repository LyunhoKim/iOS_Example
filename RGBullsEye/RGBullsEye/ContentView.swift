//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Lyunho Kim on 2019/08/27.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0 ..< 1)
    let gTarget = Double.random(in: 0 ..< 1)
    let bTarget = Double.random(in: 0 ..< 1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Rectangle().foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget))
                    Text("Match this color")
                }
            
                VStack {
                    Rectangle().foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess))
                    HStack {
                        Text("R: \(Int(rGuess * 255.0))")
                        Text("G: \(Int(gGuess * 255.0))")
                        Text("B: \(Int(bGuess * 255.0))")
                    }
                    
                }
            }
            Button(action: {
                self.showAlert = true
            }) {
                Text("Hit Me!")
            }.alert(isPresented: $showAlert) { () -> Alert in
                return Alert(title: Text("YourScore"), message: Text("\(computeScore())"), dismissButton: nil)
            }
            VStack {
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
            }
        }
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            //                    Slider(value: $rGuess, in: 0.0 ..< 1.0)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding()
    }
}
