//
//  TitleRow.swift
//  ChatAppDemo
//
//  Created by Iwy2th on 04/07/2023.
//

import SwiftUI

struct TitleRow: View {
  var imageURL = URL(string: "https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8UG9ydHJhaXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60")
  var name = "John Tommy"

    var body: some View {
      HStack(spacing: 20) {
        AsyncImage(url: imageURL) { image in
          image.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .cornerRadius(50)
        } placeholder: {
          ProgressView()
        }
        VStack(alignment: .leading) {
          Text(name)
            .font(.title).bold()
          Text("Online")
            .font(.caption)
            .foregroundColor(.green)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        Image(systemName: "phone.fill")
          .foregroundColor(.gray)
          .padding(10)
          .background(.white)
          .cornerRadius(50)
      }//: HSTACK
      .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
        .background(Color("Peach"))
    }
}
