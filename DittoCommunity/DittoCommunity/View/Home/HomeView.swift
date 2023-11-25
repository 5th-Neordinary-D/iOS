//
//  HomeView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var mainTabVM: MainTabViewModel
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            topBar
            VStack(spacing: 0) {
                categoriesView
                feedList
            }
            .padding(.top, viewModel.tPadding)
        }
        .background(alignment: .top, content: {
            title.padding(.top, 44)
        })
    }
    
    @ViewBuilder var topBar: some View {
        CustomNavigationBar(
            isDisplayTrailingBtn: true,
            trailingItems: [
                (.bell, { }),
                (.search, { })
            ]
        )
    }
    
    @ViewBuilder var title: some View {
        HStack {
            Text("하루님,\n어떤 하루를 보내고 계신가요?")
            Spacer()
        }
        .font(.h1)
        .foregroundColor(.gray07)
        .opacity(viewModel.opacity)
        .lineSpacing(6)
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
    
    @ViewBuilder var categoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                dropBox
                    .padding(.leading, 20)
                ForEach(FeedCategory.allCases, id: \.self) { category in
                    let isLastCell = category == .family
                    categoryCell(category)
                        .padding(.trailing, isLastCell ? 12 : 0)
                }
            }
        }
        .frame(height: 66)
        .frame(maxWidth: .infinity)
        .overlay(alignment: .bottom) {
            Color.gray01.frame(maxWidth: .infinity).frame(height: 1)
        }
        .overlay(alignment: .bottomLeading) {
            if viewModel.shouldShowDropbox {
                filterDropbox
                    .offset(x: 20, y: 92)
            }
        }
    }
    
    @ViewBuilder var dropBox: some View {
        Menu {
            ForEach(FilterItem.allCases, id: \.self) { item in
                Button {
                    viewModel.selectedFilter = item
                } label: {
                    Label {
                        Text(item.title)
                    } icon: {
                        if viewModel.selectedFilter == item {
                            Icon.check.image
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 2) {
                Text(viewModel.selectedFilter.title)
                Icon.arrowDown.image
            }
            .font(.b2)
            .padding(.horizontal, 12)
            .frame(height: 34)
            .foregroundColor(.gray07)
            .background(Color.gray01)
            .cornerRadius(8)
        }
    }
    
    @ViewBuilder func categoryCell(_ category: FeedCategory) -> some View {
        Button(action: {
            viewModel.selectedTab = category
        }, label: {
            
            let isSelected = viewModel.selectedTab == category
            
            Text(category.title)
                .frame(height: 34)
                .padding(.horizontal, 12)
                .font(.b2)
                .background(
                    isSelected ? Color.gray07 : Color.gray01
                )
                .foregroundColor(
                    isSelected ? .white : .gray07
                )
                .cornerRadius(8)
        })
    }
    
    @ViewBuilder var filterDropbox: some View {
        VStack(spacing: 0) {
            ForEach(FilterItem.allCases, id: \.self) { item in
                filterCell(item)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .frame(width: 99)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }
    
    @ViewBuilder func filterCell(_ item: FilterItem) -> some View {
        Button(action: {
            viewModel.selectedFilter = item
            viewModel.shouldShowDropbox = false
        }, label: {
            HStack(spacing: 4) {
                Text(item.title)
                Spacer()
                if viewModel.selectedFilter == item {
                    Icon.check.image
                }
            }
            .font(.b2)
            .foregroundColor(.gray07)
            .frame(height: 38)
            .background(Color.white)
        })
    }
    
    @ViewBuilder var feedList: some View {
        ScrollView {
            LazyVStack(content: {
                ForEach(Array(viewModel.feeds.enumerated()), id: \.offset) { index, feed in
                    FeedCellView(index: index)
                        .background(Color.white)
                        .overlay(alignment: .bottom, content: {
                            if index != viewModel.feeds.count - 1 {
                                Color.gray03
                                    .frame(height: 1)
                            }
                        })
                        .padding(.horizontal, 20)
                        .environmentObject(viewModel)
                        .onTapGesture {
//                            guard appState.didTest else {
//                                mainTabVM.alert(.init(
//                                    title: "디토 테스트 결과가 없어요",
//                                    message: "디토 테스트 후에 글을 작성할 수가 있어요!",
//                                    primaryButton: "구경만 할래요",
//                                    primaryAction: { mainTabVM.resetAlert() },
//                                    secondaryButton: "테스트 할래요",
//                                    secondaryAction: { 
//                                        mainTabVM.resetAlert()
//                                        mainTabVM.navigate(to: .test)
//                                    })
//                                )
//                                return
//                            }
                            mainTabVM.navigate(to: .feedDetail(feed.feedId))
                        }
                }
            })
            .scrollOffset { viewModel.didScroll($0) }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

enum FeedCategory: CaseIterable {
    case all, 
         relationship,
         love,
         company,
         family,
         employment,
         health,
         selfdev,
         pet,
         etc
    
    var title: String {
        switch self {
        case .all:
            return "전체글"
        case .relationship:
            return "인간관계"
        case .love:
            return "연애"
        case .company:
            return "회사"
        case .family:
            return "가족"
        case .employment:
            return "취업/이직"
        case .health:
            return "건강"
        case .selfdev:
            return "자기계발"
        case .pet:
            return "반려동물"
        case .etc:
            return "기타"
        }
    }
    
    var query: String {
        switch self {
        case .all:
            return "default"
        case .relationship:
            return "RELATIONSHIP"
        case .love:
            return "LOVE"
        case .company:
            return "COMPANY"
        case .family:
            return "FAMILY"
        case .employment:
            return "EMPLOYMENT"
        case .health:
            return "HEALTH"
        case .selfdev:
            return "SELFDEV"
        case .pet:
            return "PET"
        case .etc:
            return "ETC"
        }
    }
}

enum FilterItem: CaseIterable {
    case hot, latest
    
    var title: String {
        switch self {
        case .hot:
            return "인기순"
        case .latest:
            return "최신순"
        }
    }
}
