//
//  MainTabView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var viewModel = MainTabViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $viewModel.currentTab) {
                    HomeView()
                        .environmentObject(viewModel)
                        .tag(MainTab.home)
                    Text("Profile")
                        .tag(MainTab.mypage)
                }
                bottomTabBar
                dynamicDestination
            }
            .edgesIgnoringSafeArea(.bottom)
            .frame(maxHeight: .infinity)
            .sheet(isPresented: $viewModel.showFeedPostView, content: {
                Text("Feed Post")
            })
        }
    }
    
    @ViewBuilder var dynamicDestination: some View {
        NavigationLink(isActive: $viewModel.shouldNavigate) {
            viewModel.destination?.view
                .navigationBarBackButtonHidden()
                .navigationBarHidden(true)
        } label: {
            EmptyView()
        }
    }
    
    @ViewBuilder var bottomTabBar: some View {
        VStack {
            LazyVGrid(
                columns: Array(repeating: .init(), count: 3),
                content: {
                Icon.home.image
                    .onTapGesture {
                        self.viewModel.currentTab = .home
                    }
                Image(systemName: "plus.circle")
                    .onTapGesture {
                        viewModel.showFeedPostView = true
                    }
                Icon.mypage.image
                    .onTapGesture {
                        viewModel.currentTab
                        = .mypage
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
