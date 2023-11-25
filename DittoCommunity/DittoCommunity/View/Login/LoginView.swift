//
//  LoginView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image("login")
                    .padding(.top, 98)
                    .padding(.bottom, 32)
                loginButtonList
                    .padding(.bottom, 16)
                bottomButton
            }
            .padding(.bottom, 101)
            .edgesIgnoringSafeArea(.bottom)
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder var loginButtonList: some View {
        VStack(spacing: 8) {
            ForEach(LoginMethod.allCases, id: \.self) { method in
                NavigationLink {
                    SympathyTestView(pageIndex: 0)
                } label: {
                    loginButtonCell(method)
                }
            }
        }
    }
    
    @ViewBuilder func loginButtonCell(_ method: LoginMethod) -> some View {
        HStack(spacing: 8) {
            method.icon
            Text(method.buttonTitle)
                .foregroundColor(method.textColor)
                .font(.b2)
        }
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .background(method.backgroundColor)
        .overlay {
            if let borderColor = method.borderColor {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(borderColor, lineWidth:1)
            }
        }
        .cornerRadius(5)
    }
    
    @ViewBuilder var bottomButton: some View {
        HStack(spacing: 36) {
            Text("이메일로 로그인")
            Text("이메일로 회원가입")
        }
        .font(.b2)
        .foregroundColor(.gray05)
        .frame(height: 22)
    }
}

enum LoginMethod: CaseIterable {
    
    case kakao, naver, google
    
    var textColor: Color {
        switch self {
        case .kakao:
            return Color(hex: "381E1F")
        case .naver:
            return .white
        case .google:
            return .gray07
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .kakao:
            return Color(hex: "F9E001")
        case .naver:
            return Color(hex: "2EC623")
        case .google:
            return .white
        }
    }
    
    var borderColor: Color? {
        switch self {
        case .kakao:
            return .none
        case .naver:
            return .none
        case .google:
            return .gray03
        }
    }
    
    var icon: Image {
        switch self {
        case .kakao:
            return Icon.kakao.image
        case .naver:
            return Icon.naver.image
        case .google:
            return Icon.google.image
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .kakao:
            return "카카오로 로그인"
        case .naver:
            return "네이버로 로그인"
        case .google:
            return "구글로 로그인"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
