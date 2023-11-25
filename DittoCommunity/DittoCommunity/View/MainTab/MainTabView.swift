//
//  MainTabView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State var tabTag = 1
    @State var showFeedPostView = false
    
    var body: some View {
        VStack {
            TabView(selection: $tabTag) {
                Text("Feed")
                    .tag(1)
                Text("Profile")
                    .tag(2)
            }
            .frame(maxHeight: .infinity)
            bottomTabBar
        }
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxHeight: .infinity)
        .sheet(isPresented: $showFeedPostView, content: {
            Text("Feed Post")
        })
    }
    
    @ViewBuilder var bottomTabBar: some View {
        HStack {
            Label(
                title: { Text("Feed") },
                icon: { Image(systemName: "list.bullet") }
            ).onTapGesture {
                self.tabTag = 1
            }
            Spacer()
            Image(systemName: "plus.circle")
                .onTapGesture {
                    showFeedPostView = true
                }
            Spacer()
            Label(
                title: { Text("Profile") },
                icon: { Image(systemName: "person") }
            ).onTapGesture {
                self.tabTag = 2
            }
        }
        .padding(.bottom, 50)
        .padding(.horizontal, 50)
        .padding(.top, 20)
        .background(Color.gray.opacity(0.1))
    }
}

struct MainTabView_Previews: PreviewProvider {
        static var previews: some View {
            MainTabView()
        }
}

enum MainTabItem: Int {
    case feedList = 1
    case profile = 2
}
