//
//  TestCompleteModalView.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct TestCompleteModalView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            
            ModalView()
            
        }
    }
}

private struct ModalView: View {
    
    private var name: String = "너디너리"
    
    fileprivate var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 73) {
                Text("공감 테스트 완료")
                
                Text("\(name)님의\n의 공감지수")
                
                CircularProgressView(progress: 68)
                
                Button(
                    action: {
                        
                    },
                    label: {
                        RoundedRectangle(cornerRadius: 100)
                            .overlay {
                                Text("공감지수 올리러 가기")
                                    .foregroundColor(.white)
                            }
                            .frame(width: 206, height: 41)
                    }
                )
            }
        }
        .frame(width: 347, height: 554)
        .cornerRadius(20)
    }
    
}

private struct CircularProgressView: View {
    
    let progress: Int	// 공감지수
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.pink.opacity(0.5),
                    lineWidth: 12
                )
            Circle()
            // 2
                .trim(from: 0, to: CGFloat(progress)/100)
                .stroke(
                    Color.pink,
                    style: StrokeStyle(
                        lineWidth: 12,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
            
            VStack {
                Text("공감지수")
                Text("\(progress)%")
            }
        }
        .frame(width: 100, height: 100)
    }
}


struct TestCompleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        TestCompleteModalView()
    }
}
