//
//  FeedCellView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct FeedCellView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            title
                .padding(.bottom, 4)
            content
                .padding(.bottom, 12)
            bottom
        }
        .padding(.vertical, 16)
    }
    
    @ViewBuilder var title: some View {
        Text(viewModel.feeds[index].title)
            .font(.t1)
            .foregroundColor(.gray06)
            .frame(height: 26)
    }
    
    @ViewBuilder var content: some View {
        Text(viewModel.feeds[index].content)
            .font(.b2)
            .foregroundColor(Color.gray05)
            .lineSpacing(4)
    }
    
    @ViewBuilder var bottom: some View {
        HStack(spacing: 4) {
            Text(viewModel.feeds[index].category)
            Spacer()
            viewModel.feeds[index].isLikeChecked ?
                Icon.heartFill.image :
                Icon.heart.image
            Text(String(viewModel.feeds[index].likeCount))
                .padding(.trailing, 10)
            Icon.bubble.image
            Text(String(viewModel.feeds[index].commentCount))
        }
        .frame(height: 20)
        .font(.b3)
        .foregroundColor(.gray05)
    }
}
