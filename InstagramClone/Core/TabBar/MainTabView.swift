//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 20/2/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Notification")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
