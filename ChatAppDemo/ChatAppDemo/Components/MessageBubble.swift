//
//  MessageBubble.swift
//  ChatAppDemo
//
//  Created by Iwy2th on 04/07/2023.
//

import SwiftUI

struct MessageBubble: View {
  // MARK: - PROPERTIES
  var message: Message
  @State private var showTime = false
  // MARK: - BODY
  var body: some View {
    VStack(alignment: message.received ? .leading : .trailing) {
      HStack {
        Text(message.text)
          .padding()
          .background(message.received ? Color("Gray") : Color("Peach"))
          .cornerRadius(30)
      }
      .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
      .onTapGesture {
        showTime.toggle()
      }
      if showTime {
        Text("\(message.timestamp.formatted(.dateTime.hour().minute().second()))")
          .font(.caption2)
          .foregroundColor(.gray)
          .padding(message.received ? .leading : .trailing)
      }
    }
    .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
    .padding(message.received ? .leading : .trailing)
    .padding(.horizontal, 10)
  }
}
// MARK: - PREVIEW
struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
      MessageBubble(message: Message(id: "123", text: "Summary Loads and displays a modifiable image from the specified URL using a custom placeholder until the image loads.", received: false, timestamp: Date()))
    }
}
