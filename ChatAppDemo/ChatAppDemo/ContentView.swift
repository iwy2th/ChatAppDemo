//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by Iwy2th on 04/07/2023.
//

import SwiftUI

struct ContentView: View {
  var messageArray = ["Hello", "How are you?", "have good time"]
  var body: some View {
    VStack {
      VStack {
        TitleRow()
        ScrollView {
          ForEach(messageArray, id: \.self) {
            text in
            MessageBubble(message: Message(id: "1234", text: text, received: true, timestamp: Date()))
          }
        }
        .padding(.top, 10)
        .background(.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
      }// VSTACK
      .background(Color("Peach"))
      MessageField()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
