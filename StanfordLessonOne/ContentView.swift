//
//  ContentView.swift
//  StanfordLessonOne
//
//  Created by Иван Непорадный on 20.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    let emojis1 = ["😍", "😘", "😇", "🤣", "🤣", "😍", "😘", "😇", "🤣", "🤣"]
    let emojis2 = ["🤲🏻", "👐🏻", "🙌🏻", "👏🏻", "🤝", "👍🏻", "👎🏻", "👊🏻", "✊🏻", "🤛🏻"]
    let emojis3 = ["👶🏻", "👧🏻", "🧒🏻", "👦🏻", "👩🏻", "🧑🏻", "👨🏻", "👩🏻‍🦱", "🧑🏻‍🦱", "👨🏻‍🦱"]
    let emojis4 = ["🧥", "🥼", "🦺", "👚", "👕", "👖", "🩲", "🩳", "👔", "👙"]
    @State var cardCount: Int = 4
    
    //
    
    var body: some View {
        
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                

            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
            .padding()
        }
    
    //
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    
    //
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
                cardCount += offset
            
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis1.count)
    }
    
    //
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis1[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }

    
    //
    var cardRemover: some View{
       cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    //
    var cardAdder: some View{
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")

    }

    }


struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill().foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)

        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}










#Preview {
    ContentView()
}
