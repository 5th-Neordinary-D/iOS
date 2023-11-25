//
//  HomeView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var tPadding: CGFloat = 100
    @State var opacity: CGFloat = 1
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                categoriesView
                feedList
            }
            .padding(.top, tPadding)
        }
        .background(alignment: .top, content: {
            title
        })
    }
    
    @ViewBuilder var title: some View {
        HStack {
            Text("하루님,\n어떤 하루를 보내고 계신가요?")
            Spacer()
        }
        .font(.h1)
        .foregroundColor(.gray07)
        .opacity(opacity)
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
        Button(action: {
            viewModel.shouldShowDropbox.toggle()
        }, label: {
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
        })
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
                ForEach(1...10, id: \.self) { count in
                    Text("Placeholder \(count)")
                        .frame(height: 100)
                }
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

enum FeedCategory: CaseIterable {
    case all, relationship, love, company, family
    
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
        }
    }
}

enum FilterItem: CaseIterable {
    case famous, latest
    
    var title: String {
        switch self {
        case .famous:
            return "인기순"
        case .latest:
            return "최신순"
        }
    }
}
