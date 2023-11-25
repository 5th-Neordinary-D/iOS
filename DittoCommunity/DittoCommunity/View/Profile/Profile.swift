//
//  Profile.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct MyPageView: View {
    
    @State var tabIndex = 1
    @State var sympathyValue: Float = 64
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                
                CustomNavigationBar(
                    isDisplayLeadingBtn: false,
                    isDisplayTrailingBtn: true,
                    leadingItems: [],
                    trailingItems: [(Icon.setting, {})]
                )
                
                VStack(spacing: 0){
                    
                    
                    
//                    HStack{
//                        Spacer()
//
//                        NavigationLink(destination: {
//                            EmptyView()
//                        }, label: {
//                            Image("setting")
//                        })
//
//                    }
//                    .padding(.vertical, 10)
                    
                    HStack{
                        
                        //                Image("프로필")
                        //                    .resizable()
                        //                    .scaledToFit()
                        //                    .frame(width: 60, height: 60)
                        //                    .clipShape(Circle())
                        
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 60, height: 60)
                        
                        
                        Text("송월")
                            .font(.h2)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            EmptyView()
                        }, label: {
                            Text("프로필 변경")
                                .font(.b2)
                                .foregroundColor(.black)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray04)
                                )
                        })
                    }
                    .padding(.bottom, 24)
                    
                    
                    HStack {
                        Text("공감 지수")
                        
                        Text(String(Int(sympathyValue)) + "%")
                            .foregroundColor(.primary02)
                        
                        Spacer()
                    }
                    .font(.h4)
                    .padding(.bottom, 16)
                    
                    
                    GeometryReader { geo in
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 10)
                            .foregroundColor(.gray02)
                        
                        

                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: geo.size.width * CGFloat((sympathyValue / 100)),height: 10)
                            .foregroundColor(.primary02)
                            
                            Image("smileIcon")
                            .padding(3)
                            .background(
                                ZStack {
                                    Circle()
                                        .frame(width: 60)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 30)
                                        .foregroundColor(.primary02)
                                        .padding(3)
                                }
                            )
                            .padding(.top)
                            .position(x: geo.size.width * CGFloat((sympathyValue / 100)))
                    }
                    .frame(height: 10)
                    .padding(.bottom, 36)
                    
                }
                .padding(.horizontal, 20)
                
                MyPageCustomTopTabBar(tabIndex: $tabIndex)
                
                if tabIndex == 1 {
                    List{
                        ForEach(1...10, id: \.self) { _ in
                            MyPageListCell()
                        }
                    }
                    .listStyle(.plain)
                }
                
                else if tabIndex == 2 {
                    List{
                        ForEach(1...10, id: \.self) { _ in
                            MyPageListCell()
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}


struct MyPageCustomTopTabBar: View {
    
    @Binding var tabIndex: Int
    
    var body: some View {
            HStack(spacing: 0){
                
                VStack{
                    Text("작성한 글")
                        .font(tabIndex == 1 ? .h3 : .b1)
                        .foregroundColor(tabIndex == 1 ? .black : .gray05)
                        .onTapGesture {
                            tabIndex = 1
                        }
                    Rectangle().frame(width: .infinity, height: tabIndex == 1 ? 3 : 1)
                        .foregroundColor(tabIndex == 1 ? .black : .gray03)
                }
                
                
                VStack{
                    Text("공감한 글")
                        .font(tabIndex == 2 ? .h3 : .b1)
                        .foregroundColor(tabIndex == 2 ? .black : .gray05)
                        .onTapGesture {
                            tabIndex = 2
                        }
                    Rectangle().frame(width: .infinity, height: tabIndex == 2 ? 3 : 1)
                        .foregroundColor(tabIndex == 2 ? .black : .gray03)
                }
                
            }
    }
}

struct MyPageListCell: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("직장에서 이런 일이 있었네요...")
                .font(.h3)
                .foregroundColor(.gray06)
              .frame(width: 236, alignment: .topLeading)
              .padding(.bottom, 1)
              .padding(.top, 10)
            
            Text("제가 작성한 기획서를 매번 부족하다는 이유로 까고,,, 직장 상사의 감정 쓰레기통이 된 거 같아요.. ㅠ")
                .font(.b2)
                .foregroundColor(.gray05)
                .lineLimit(3)
                .truncationMode(.tail)
            
            HStack(spacing: 0){
                Text("인간관계")
                
                Spacer()
                
                Image("Heart.fill")
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 4)
                
                Text("2")
                    .padding(.trailing, 14)
                
                
                Image("bubble")
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 4)
                
                Text("1")
            
            }
            .font(.b3)
            .foregroundColor(.gray05)
            
//            Divider()
        }
        .padding(.horizontal, 20)
    }
}


struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
        MyPageListCell()
    }
}
