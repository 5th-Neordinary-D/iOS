//
//  MainTabView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State var tabTag: MainTab = .home
    @State var showFeedPostView = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $tabTag) {
                HomeView()
                    .tag(MainTab.home)
                    .toolbar(.hidden, for: .bottomBar)
                Text("Profile")
                    .tag(MainTab.mypage)
            }
            bottomTabBar
        }
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxHeight: .infinity)
        .sheet(isPresented: $showFeedPostView, content: {
            Text("Feed Post")
        })
    }
    
    @ViewBuilder var bottomTabBar: some View {
        VStack {
            LazyVGrid(
                columns: Array(repeating: .init(), count: 3),
                content: {
                Icon.home.image
                    .onTapGesture {
                        self.tabTag = .home
                    }
                Image(systemName: "plus.circle")
                    .onTapGesture {
                        showFeedPostView = true
                    }
                Icon.mypage.image
                    .onTapGesture {
                        self.tabTag = .mypage
                    }
            })
            .padding(.top, 16)
            Spacer()
        }
        .frame(height: 80)
        .overlay(alignment: .top, content: {
            Color.gray03
                .frame(maxWidth: .infinity)
                .frame(height: 1)
        })
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

enum MainTab {
    case home
    case mypage
}
