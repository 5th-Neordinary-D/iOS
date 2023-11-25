//
//  AlarmView.swift
//  DittoCommunity
//
//  Created by 황인성 on 2023/11/25.
//

import SwiftUI

struct AlarmView: View {
    var body: some View {
        
        VStack {
            
            CustomNavigationBar(
                isDisplayLeadingBtn: true,
                isDisplayTrailingBtn: false,
                leadingItems: [(Icon.chevronLeft, {})],
                trailingItems: []
            )
            
            List{
                ForEach(0...10, id: \.self) { _ in
                    AlarmCell()
                }
            }
            .listStyle(.plain)
        }
    }
}

struct AlarmCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("직장에서 이런 일이 있었네요...에 답글이 달렸어요!")
                .font(.h3)
                .foregroundColor(.gray06)
            
            Text("아이고 ㅠㅠㅠ 속상하시겠어요 ㅠㅠ")
                .font(.b2)
              .foregroundColor(.gray05)
              
            Text("30분 전")
                .font(.b3)
                .foregroundColor(.gray05)
            
        }.padding(.horizontal, 20)
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
