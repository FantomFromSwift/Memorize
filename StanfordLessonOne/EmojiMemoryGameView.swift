//
//  EmojiMemoryGameView.swift
//  StanfordLessonOne
//
//  Created by Иван Непорадный on 20.06.2024.
//



import SwiftUI

struct EmojiMemoryGameView: View {
    // Темы с эмодзи
    let halloweenEmojis = ["🎃", "👻", "🕷", "🍬", "🎃", "👻", "🕷", "🍬"]
    let animalsEmojis = ["🐶", "🐱", "🦁", "🐮", "🐶", "🐱", "🦁", "🐮"]
    let vehiclesEmojis = ["🚗", "🚌", "🚜", "🚲", "🚗", "🚌", "🚜", "🚲"]
    
    @State var emojis: [String] = []
    @State var cardCount = 8
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundColor(.red)
            ScrollView{
                cards
            }
            Spacer()
            themeButtons
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
    }
    
    var themeButtons: some View {
        HStack {
            themeButton(emojis: halloweenEmojis, symbol: "person.fill", text: "Halloween")
            Spacer()
            themeButton(emojis: animalsEmojis, symbol: "hare.fill", text: "Animals")
            Spacer()
            themeButton(emojis: vehiclesEmojis, symbol: "car.fill", text: "Vehicles")
        }
        .padding(.horizontal)
    }
    
    func themeButton(emojis: [String], symbol: String, text: String) -> some View {
        Button(action: {
            self.emojis = emojis.shuffled()
            self.cardCount = emojis.count
        }) {
            VStack {
                Image(systemName: symbol)
                    .font(.largeTitle)
                Text(text)
                    .font(.caption)
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
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
    EmojiMemoryGameView()
}
