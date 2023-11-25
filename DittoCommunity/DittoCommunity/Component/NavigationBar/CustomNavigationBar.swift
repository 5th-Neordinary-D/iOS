//
//  CustomNavigationBar.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    let isDisplayLeadingBtn: Bool
    let isDisplayTrailingBtn: Bool
    
    let leadingItems: [(Icon, () -> Void)]
    let trailingItems: [(Icon, () -> Void)]
    
    init(
        isDisplayLeadingBtn: Bool = true,
        isDisplayTrailingBtn: Bool = true,
        leadingItems: [(Icon, () -> Void)] = [(.chevronLeft, {})],
        trailingItems: [(Icon, () -> Void)] = [(.chevronLeft, {}), (.chevronLeft, {})]
    ) {
        self.isDisplayLeadingBtn = isDisplayLeadingBtn
        self.isDisplayTrailingBtn = isDisplayTrailingBtn
        self.leadingItems = leadingItems
        self.trailingItems = trailingItems
    }
    
    var body: some View {
        HStack(spacing: 0) {
            if isDisplayLeadingBtn {
                ForEach(leadingItems, id: \.0, content: { item in
                    Button(
                        action: {
                            item.1()
                        },
                        label: {
                            item.0.image
                        }
                    )
                })
            }
            
            Spacer()
            
            if isDisplayTrailingBtn {
                ForEach(trailingItems, id: \.0, content: { item in
                    Button(
                        action: {
                            item.1()
                        },
                        label: {
                            item.0.image
                        }
                    )
                    .padding(.leading, 18)
                })
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 44)
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
            .previewLayout(.sizeThatFits)
    }
}
