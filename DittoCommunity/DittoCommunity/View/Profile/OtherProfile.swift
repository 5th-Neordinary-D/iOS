//
//  OtherProfile.swift
//  DittoCommunity
//
//  Created by 황인성 on 2023/11/25.
//

import SwiftUI

struct OtherProfile: View {
    
    @State var tabIndex = 1
    @State var sympathyValue: Float = 64
    
    var body: some View {
        NavigationView {
            VStack{
                
                CustomNavigationBar(
                    isDisplayLeadingBtn: false,
                    isDisplayTrailingBtn: true,
                    leadingItems: [],
                    trailingItems: [(Icon.more_vertical, {})]
                )
                
                VStack(spacing: 0){
                    
//                    HStack{
//                        Spacer()
//
//                        NavigationLink(destination: {
//                            EmptyView()
//                        }, label: {
//                            Image("more-vertical")
//                        })
//
//                    }
//                    .padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
//                        Circle()
//                            .foregroundColor(.black)
//                            .frame(width: 60, height: 60)
                        
                        
                        VStack(alignment: .leading) {
                            Text("송월")
                                .font(.h2)
                            .foregroundColor(.black)
                            .padding(.bottom, 1)
                            
                            HStack {
                                Text("디토지수")
                                    .font(.b2)
                                
                                Text(String(Int(sympathyValue)) + "%")
                                    .font(.h4)
                                    .foregroundColor(.primary02)
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            EmptyView()
                        }, label: {
                            Text("디토 보내기")
                                .font(.h4)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.primary02)
                                )
                        })
                    }
                    .padding(.bottom, 24)
                    
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

struct OtherProfile_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfile()
    }
}
