////
////  CategoryModalView2.swift
////  DittoCommunity
////
////  Created by Subeen on 2023/11/26.
////
//
//import SwiftUI
//import WrappingHStack
//import PopupView
//
//struct CategoryModalView: View {
//    @Binding var isCategoryTapped: Bool
//    @Binding var category: String
//    
//    
//    init(
//        isCategoryTapped: Binding<Bool> = .constant(true),
//        category: Binding<String> = .constant("")
//    ) {
//        _isCategoryTapped = isCategoryTapped
//        _category = category
//    }
//    
//    var body: some View {
////        CategoryView()
//        
//        ZStack {
//                    Color.white
//                    VStack(spacing: 0) {
//                        Spacer()
//                            .frame(height: 8)
//                        Rectangle()
//                            .foregroundColor(.gray03)
//                        .frame(width: 90, height: 6)
//                        .cornerRadius(50)
//                        Spacer()
//                            .frame(height: 32)
//        //                CategoryListView()
//                        WrappingHStack(CategoryType.allCases, id:\.self) { category in
//                            Button(
//                                action: {
//                                    self.category = category.description
//                                    isCategoryTapped.toggle()
//                                },
//                                label: {
//                                    Text(category.description)
//                                        .font(.b2)
//                                        .foregroundColor(.gray07)
//                                        .padding(.horizontal, 12)
//                                        .padding(.vertical, 6)
//                                        .background(Color.gray01)
//                                        .cornerRadius(8)
//                                }
//                            )
//                            .padding(.bottom, 8)
//                        }
//                        .padding(.leading, 19)
//                        Spacer()
//                    }
//                }
//                .frame(height: 210)
//                .roundedCorner(30, corners: [.topLeft, .topRight])
//    }
//}
//
//// MARK: - 카테고리 뷰
////private struct CategoryView: View {
////
////    fileprivate var body: some View {
////        ZStack {
////            Color.white
////            VStack(spacing: 0) {
////                Spacer()
////                    .frame(height: 8)
////                Rectangle()
////                    .foregroundColor(.gray03)
////                .frame(width: 90, height: 6)
////                .cornerRadius(50)
////                Spacer()
////                    .frame(height: 32)
//////                CategoryListView()
////                WrappingHStack(CategoryType.allCases, id:\.self) { category in
////                    Button(
////                        action: {
////
////                        },
////                        label: {
////                            Text(category.description)
////                                .font(.b2)
////                                .foregroundColor(.gray07)
////                                .padding(.horizontal, 12)
////                                .padding(.vertical, 6)
////                                .background(Color.gray01)
////                                .cornerRadius(8)
////                        }
////                    )
////                    .padding(.bottom, 8)
////                }
////                .padding(.leading, 19)
////                Spacer()
////            }
////        }
////        .frame(height: 210)
////        .roundedCorner(30, corners: [.topLeft, .topRight])
////    }
////}
//
//// MARK: - 카테고리 셀 뷰
//
////fileprivate struct CategoryListView: View {
////
////    fileprivate var body: some View {
////        WrappingHStack(CategoryType.allCases, id:\.self) { category in
////            Button(
////                action: {
////
////                },
////                label: {
////                    Text(category.description)
////                        .font(.b2)
////                        .foregroundColor(.gray07)
////                        .padding(.horizontal, 12)
////                        .padding(.vertical, 6)
////                        .background(Color.gray01)
////                        .cornerRadius(8)
////                }
////            )
////            .padding(.bottom, 8)
////        }
////        .padding(.leading, 19)
////    }
////}
//
//
//struct CategoryModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        CategoryModalView2()
//            .previewLayout(.sizeThatFits)
//    }
//}
//
//// MARK: - 부분 Radius 설정
//
//struct RoundedCorner: Shape {
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
//
//extension View {
//    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape(RoundedCorner(radius: radius, corners: corners) )
//    }
//}
