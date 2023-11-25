//
//  ActionSheetView.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct ActionSheetView: View {
    
    let items: [(String, () -> Void)]
    
    init(items: [(String, () -> Void)] = [("프로필 방문", {}), ("프로필 방문2", {}), ("프로필 방문3", {})]) {
        self.items = items
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                Spacer()
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 60 * CGFloat(items.count))
                    .overlay {
                        VStack(spacing: 0) {

                            ForEach(items, id: \.0, content: { item in
                                Button(
                                    action: {
                                        item.1()
                                    },
                                    label: {
                                        Text(item.0)
                                            .font(.b1)
                                            .foregroundColor(.gray07)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                )
                                Rectangle()
                                    .frame(height: 1)
                                
                            })
                        }
                        .foregroundColor(.gray03)
                    }
            }
            .edgesIgnoringSafeArea(.bottom)
                
        }
    }
}



struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}
