//
//  ContentView.swift
//  swiftUI_exmpl
//
//  Created by Олег Кор on 03.06.2023.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["⛄️", "🧗‍♂️ ", "🍑", "🫖", "🏄","🫖", "🏄"]
    @State var myEmojiCount: Int = 2
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(), GridItem(),GridItem(),GridItem()]) {
                ForEach(emojis[0..<myEmojiCount], id: \.self)  {emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(.purple)
            Spacer(minLength: 50)
            HStack {
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .foregroundColor(.blue)
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if myEmojiCount < 10 {
                myEmojiCount += 1
                print(myEmojiCount)
            }
            } label: {
                    Image(systemName: "plus.circle")
            }
    }
    var remove: some View {
        Button {
            if myEmojiCount > 1 {
                myEmojiCount -= 1
            }
            } label: {
                    Image(systemName: "minus.circle")
            }
    }
    
    // MARK - Вид устанавливаемых карт для игры
    struct CardView: View {
        var content: String
        @State var isFaceUp: Bool = false
        var body: some View {
            ZStack (alignment: .center)  {
                //            let shapeOfCard = Circle()
                let shapeOfCard = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shapeOfCard.fill().foregroundColor(.white)
                    shapeOfCard.stroke(lineWidth: 3)
                    Text(content).font(.largeTitle)
                } else {
                    shapeOfCard.fill()
                }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
}






























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
