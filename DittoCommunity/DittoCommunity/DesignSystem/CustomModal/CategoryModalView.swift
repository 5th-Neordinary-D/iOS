//
//  CategoryModalView.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct CategoryModalView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            VStack {
                Spacer()
                categoryView()
            }
        }
    }
}

// MARK: - 카테고리 뷰
@ViewBuilder
private func categoryView() -> some View {
    
    ZStack {
        Color.white
        categoryCellView(category: "고민")
    }
    .frame(height: 300)
    .roundedCorner(30, corners: [.topLeft, .topRight])
	
}

// MARK: - 카테고리 셀 뷰
@ViewBuilder
private func categoryCellView(category: String) -> some View {
    
    let columns: [GridItem] = [
            GridItem(.flexible(), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    LazyVGrid(columns: columns) {
        ForEach(0..<12) { index in
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.gray03)
                .frame(width: 100, height: 50)
                .overlay {
                    Text(category)
            }
        }
    }
}


struct CategoryModalView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryModalView()
				.previewLayout(.sizeThatFits)
    }
}

// MARK: - 부분 Radius 설정

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
		
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
