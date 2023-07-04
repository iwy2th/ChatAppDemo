//
//  MessageField.swift
//  ChatAppDemo
//
//  Created by Iwy2th on 04/07/2023.
//

import SwiftUI

struct MessageField: View {
  // MARK: - PROPERTIES
  @EnvironmentObject var messagesManager: MessagesManager
  @State private var message = ""
  // MARK: - BODY
  var body: some View {
    HStack {
      CustomTextField(placeholder: Text("Enter your message here"), text: $message)
      Button {
        print("Message send! ")
        messagesManager.sendMessage(text: message)
        message = ""
      } label: {
        Image(systemName: "paperplane.fill")
          .padding(10)
          .foregroundColor(.white)
          .background(Color("Peach"))
          .cornerRadius(50)
      }
    }
    .padding(.horizontal)
    .padding(.vertical, 10)
    .background(Color("Gray"))
    .cornerRadius(50)
    .padding()
  }
}
// MARK: - PREVIEW

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
        .environmentObject(MessagesManager())
    }
}
struct CustomTextField: View {
  var placeholder: Text
  @Binding var text: String
  var editingChanged: (Bool) -> () = {_ in}
  var commit: () -> () = {}
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        placeholder
          .opacity(0.5)
      }
      TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit )
    }
  }
}
