//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by Iwy2th on 04/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
  @Published private(set) var messages: [Message] = []
  @Published private(set) var lastMessageId = ""
  let db = Firestore.firestore()
  init() {
    getMessage()
  }
  func getMessage() {
    db.collection("messages").addSnapshotListener { querySnapshot, error in
      guard let doc = querySnapshot?.documents else {
        print("Error doc \(String(describing: error))")
        return
      }
      self.messages = doc.compactMap { document -> Message? in
        do {
          return try document.data(as: Message.self )
        } catch {
          print("Error decoding \(error)")
          return nil
        }
      }
      self.messages.sort{$0.timestamp < $1.timestamp }
      if let id = self.messages.last?.id {
        self.lastMessageId = id 
      }
    }
  }
  func sendMessage(text: String) {
    do {
      let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
      try db.collection("messages").document().setData(from: newMessage)
    } catch {
      print("Error addng message to Firestore \(error)")
    }
  }
}
