//
//  MainView.swift
//  InstagramRecreation
//
//  Created by peter wi on 4/18/22.
//

import SwiftUI

struct MainView: View {
    
    let profileName : [String] = ["profile4", "profile2", "profile3", "profile2","profile","profile3","profile4","profile2","profile3","profile2"]
    
    var stories: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack {
                    ZStack {
                        ProfileImage(imgName: "profile", width: 50)
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.background, .blue)
                            .offset(x: 15, y: 15)
                            .font(.title2)
                    }
                    Text("Your story")
                        .font(.caption)
                        .bold()
                }
                ForEach(profileName, id: \.self) { img in
                    VStack {
                        ProfileImage(imgName: img, width: 50)
                            .padding(2)
                            .overlay(Circle().stroke(img.hash%2==0 ? .green : .red, lineWidth: 3))
                        Text(img)
                            .font(.caption)
                            .bold()
                    }
                }
                .padding(3)
            }
        }
        .padding(.horizontal)
    }
    
    var topButtons: some View {
        Group {
            Button {
                // do something
            } label: {
                Image(systemName: "plus.app")
            }
            Button {
                // do something
            } label: {
                Image(systemName: "heart")
            }
            Button {
                //do something
            } label: {
                Image(systemName: "paperplane")
            }
        }
        .foregroundColor(.primary)
        .font(.title3)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                stories
                ForEach(0...5, id: \.self) { _ in
                    PostView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Instagram")
                        .font(.custom("Times", size: 34, relativeTo: .title))
                        .italic()
                        .bold()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    topButtons
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
