//
//  MainTabView.swift
//  AirBnbClone
//
//  Created by Avijit bera on 10/03/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem{
                    Label("Explore", systemImage: "magnifyingglass")
                }
            WishlistView()
                .tabItem{
                    Label("Wishlists", systemImage: "heart")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
