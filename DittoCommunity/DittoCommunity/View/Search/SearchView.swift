//
//  SearchView.swift
//  DittoCommunity
//
//  Created by 황인성 on 2023/11/25.
//

import SwiftUI

struct CustomSearchTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.gray01)
            .cornerRadius(100)
            .overlay(
                HStack {
                    Spacer()
                    Image("search")
                        .padding(.horizontal, 10)
                        .foregroundColor(.gray)
                }
            )
    }
}

struct SearchView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack {
            TextField("공감 글을 검색하세요", text: $text)
                .textFieldStyle(CustomSearchTextFieldStyle())
                .padding(.horizontal, 20)
            
            if text.isEmpty != true {
                List{
                    ForEach(1...10, id: \.self) { _ in
                        MyPageListCell()
                    }
                }
                .listStyle(.plain)
            }
            else {
                Spacer()
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
