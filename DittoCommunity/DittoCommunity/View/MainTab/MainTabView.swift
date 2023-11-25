//
//  MainTabView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var appState: AppState
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
                    MyPageView()
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
        .overlay {
            if viewModel.showAlert,
               let alert = viewModel.alert {
                CustomAlertView(
                    alertTitle: alert.title,
                    alertSubTitle: alert.message,
                    leftBtnTitle: alert.primaryButton,
                    rightBtnTitle: alert.secondaryButton, 
                    leftBtnAction: { alert.primaryAction() },
                    rightBtnAction: { alert.secondaryAction() }
                )
            } else {
                EmptyView()
            }
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
                    Group {
                        viewModel.currentTab == .home ?
                        Icon.homeFill.image : Icon.home.image
                    }
                    .onTapGesture {
                        self.viewModel.currentTab = .home
                    }
                    Icon.plus.image
                        .onTapGesture {
                            viewModel.showFeedPostView = true
                        }
                    Group {
                        viewModel.currentTab == .mypage ?
                        Icon.mypageFill.image : Icon.mypage.image
                    }
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
