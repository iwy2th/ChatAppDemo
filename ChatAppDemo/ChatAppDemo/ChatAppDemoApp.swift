//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by Iwy2th on 04/07/2023.
//

import SwiftUI
import Firebase

@main
struct ChatAppDemoApp: App {
  init() {
    FirebaseApp.configure()
  }
  var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
