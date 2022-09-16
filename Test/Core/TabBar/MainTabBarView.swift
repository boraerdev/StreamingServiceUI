//
//  MainTabBarView.swift
//  Test
//
//  Created by Bora Erdem on 15.09.2022.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        ZStack{
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(0)
                
                FindView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Ara")
                    }
                    .tag(1)
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "tray.and.arrow.down")
                        Text("İndirilenler")
                    }
                    .tag(2)
                Text("Person")
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profil")
                    }
                    .tag(3)
            }
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
            .preferredColorScheme(.dark)
    }
}
