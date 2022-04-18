//
//  ContentView.swift
//  InstagramRecreation
//
//  Created by peter wi on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .center) {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                Text("pita.parking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal, 10)
            Image("image")
                .resizable()
                .scaledToFit()
            HStack {
                Image(systemName: "heart")
                Image(systemName: "message")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .padding(.horizontal, 10)
            HStack {
                ZStack {
                    ProfileImage(imgName: "profile2")
                        .zIndex(3)
                    ProfileImage(imgName: "profile3")
                        .offset(x: 13)
                        .zIndex(2)
                    ProfileImage(imgName: "profile4")
                        .offset(x: 26)
                        .zIndex(1)
                }
                
                Text("Liked by __sith and 2 others")
                    .offset(x: 30)
            }
            .padding(.horizontal, 10)
            Group {
                Text("pita.parking 🌧 🌺 🍒")
                Text("3 hours ago")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ProfileImage: View {
    let imgName: String
    var body: some View {
        Image(imgName)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 20, height: 20)
            .overlay(Circle().stroke(.background, lineWidth: 2))
    }
}
