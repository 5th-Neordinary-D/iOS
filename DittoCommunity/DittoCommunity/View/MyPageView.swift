//
//  MyPageView.swift
//  DittoCommunity
//
//  Created by 황인성 on 2023/11/25.
//

import SwiftUI

struct MyPageView: View {
    
    @State var tabIndex = 1
    
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 63, height: 63)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(31.5)
                
                Text("송월")
                    .font(.h2)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("프로필 변경")
                    .font(.b2)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(lineWidth: 1)
                    )
                
                
            }
            
            
            Text("공감 지수")
                .font(Font.custom("Inter", size: 12))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            ProgressView(value: 0.5)
                .padding()
            
            MyPageCustomTopTabBar(tabIndex: $tabIndex)
            
            if tabIndex == 1 {
                
            }
            
        }
    }
}


struct MyPageCustomTopTabBar: View {
    
    @Binding var tabIndex: Int
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0){
                
                VStack{
                    Text("작성한 글")
                        .onTapGesture {
                            tabIndex = 1
                        }
                    Rectangle().frame(width: geo.size.width / 2, height: 2)
                        .foregroundColor(tabIndex == 1 ? .black : .clear)
                }
                .position(x: geo.size.width / 4)
                
                
                VStack{
                    Text("공감한 글")
                        .onTapGesture {
                            tabIndex = 2
                        }
                    Rectangle().frame(width: geo.size.width / 2, height: 2)
                        .foregroundColor(tabIndex == 2 ? .black : .clear)
                }
                .position(x: geo.size.width / 4)
                
            }
        }
    }
}

struct MyPageListCell: View {
    
    var body: some View {
        VStack {
            Text("제목")
            
            Text("내용kjflkajsdljasdjkklsncsahoidsajklcnbjsahdiosakjlncbksajfhosaihdknsakbfjsahdfoisaklncbsakjdsaㅁㄴ언마ㅠㄹㄴㅁ뢘며어ㅕㅗㄴ몽챈며ㅙ촌머ㅗ치ㅓㄴ모채ㅗㄴ매초매ㅗ")
                .lineLimit(3)
                .truncationMode(.tail)
                .padding()
            
            HStack{
                
            }
            
        }
    }
}


struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
        MyPageListCell()
    }
}
