//
//  ContentView.swift
//  InstagramRecreation
//
//  Created by peter wi on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isLike = false
    @State private var isBookmark = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            header
            
            Image("image")
                .resizable()
                .scaledToFit()
            buttons
            likes
            contentMessage
        }
    }
    
    private var header: some View {
        HStack(alignment: .center) {
            ProfileImage(imgName: "profile", width: 30)
            Text("pita.parking")
                .bold()
            Spacer()
            Button {
                // show menu
            } label: {
                Image(systemName: "ellipsis")
            }
            .foregroundColor(.primary)
        }
        .padding(.horizontal, 10)
    }
    
    private var buttons: some View {
        HStack {
            Button {
                isLike.toggle()
            } label: {
                Image(systemName: isLike ? "heart.fill" : "heart")
                    .font(.title2)
                    .foregroundColor(isLike ? .red : .primary)
            }
            Button {
                // show the comments page.
            } label: {
                Image(systemName: "message")
                    .font(.title2)
            }
            Button {
                // deliver it to some other people.
            } label: {
                Image(systemName: "paperplane")
                    .font(.title2)
            }
            Spacer()
            Button {
                isBookmark.toggle()
            } label: {
                Image(systemName: isBookmark ? "bookmark.fill" : "bookmark")
                    .font(.title2)
            }
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 10)
    }
    
    private var likes: some View {
        HStack {
            ZStack {
                ProfileImage(imgName: "profile2", width: 20)
                    .zIndex(3)
                ProfileImage(imgName: "profile3", width: 20)
                    .offset(x: 13)
                    .zIndex(2)
                ProfileImage(imgName: "profile4", width: 20)
                    .offset(x: 26)
                    .zIndex(1)
            }
            .padding(.trailing, 30)
            
            Text("Liked by **____sith** and **2 others**")
        }
        .padding(.horizontal, 10)
    }
    
    private var contentMessage: some View {
        Group {
            HStack {
                Text("pita.parking")
                    .bold()
                Text("🌧 🌺 🍒")
            }
            Text("3 hours ago")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ProfileImage: View {
    let imgName: String
    let width: CGFloat
    
    var body: some View {
        Image(imgName)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: width, height: width)
            .overlay(Circle().stroke(.background, lineWidth: 2))
    }
}
