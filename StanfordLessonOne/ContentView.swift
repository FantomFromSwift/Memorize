//
//  ContentView.swift
//  StanfordLessonOne
//
//  Created by Иван Непорадный on 20.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
         CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)

        }
        .foregroundColor(Color.orange)
        .padding()

    }
}

struct CardView: View{
    @State var isFaceUp: Bool = false
    
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base
                    .fill()
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text("😍")
                    .font(.largeTitle)
            } else {
                base
                    .fill()
                
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}










#Preview {
    ContentView()
}
