//
//  Message.swift
//  ChatAppDemo
//
//  Created by Iwy2th on 04/07/2023.
//

import Foundation

struct Message: Identifiable, Codable {
  var id: String
  var text: String
  var received: Bool
  var timestamp: Date
}
