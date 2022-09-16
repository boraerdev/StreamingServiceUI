//
//  ContentView.swift
//  Test
//
//  Created by Bora Erdem on 15.09.2022.
//

import SwiftUI
import UIKit


struct HomeView: View {
    
    
    //MARK: Def
    @State var selectedBg: Int = 0
    @Namespace var namespace

    //MARK: Fake Data
    let movies: [String] = ["joker", "matrix", "us", "polis"]
    let top10 = Array(1..<6).map({return "h\($0)"})
    let vList = Array(1..<5).map({return "v\($0)"})
    
    //MARK: View
    var body: some View {
        ZStack{
            NavigationView {
                ZStack {
                    bgBlurImage
                    ScrollView(showsIndicators: false){
                        userHeader
                        hScrollHeader
                        gridView
                    }
                }
                .navigationTitle("Home")
                .navigationBarHidden(true)
                .toolbar(.visible, for: .tabBar)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}


//MARK: Funcs
extension HomeView{
    
    func getScale(proxy: GeometryProxy, index: Int) -> CGFloat {
        let diff = proxy.frame(in: .global).minX
        var scale: CGFloat = 1
        if abs(diff) < 100 {
            withAnimation {
                selectedBg = index
            }
                scale = 1 + (100 - abs(diff)) / 550
            
        }
        return scale
    }
}


//MARK: UI
extension HomeView{
    
    private var bgBlurImage: some View{
        VStack{
            Image(movies[selectedBg])
                .resizable()
                .blur(radius: 20)
            Color.black.opacity(0.5)
        }
        .ignoresSafeArea()
    }
    
    private var hScrollHeader: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(0..<movies.count){ num in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy, index: num)
                        NavigationLink {
                            DetailView()
                                .navigationBarHidden(true)
                                .statusBarHidden()
                        } label: {
                            VStack{
                                Image(movies[num])
                                    .resizable()
                                    .scaledToFill()
                            }
                            .frame(width: 200)
                            .cornerRadius(10)
                            .scaleEffect(.init(scale))
                            .shadow(color: .white.opacity(0.3), radius: 5, x: 0, y: 0)
                        }
                    }
                    .frame(width: 210, height: 320)
                }
            }
            .padding(30)
            .padding(.trailing,120)
        }
    }
    
    private var userHeader: some View{
        HStack{
            VStack(alignment: .leading){
                Text("Tekrar Hoş Geldin,")
                    .font(.system(size: 13, weight: .light))
                Text("Bora Erdem")
                    .font(.system(size: 22, weight: .black))
            }
            Spacer()
            Image("pp")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 30, height: 30)
        }
        .padding(20)
    }
    
    private var gridView: some View {
        VStack{
            
            //Hview For You
            Text("Senin için")
                .font(.system(size: 17))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
            horizontalScroll(width: 120, height: 180, spacing: 10, topList: false, resorce: vList)
            
            //HView Top List
            Text("Top 10 Türkiye")
                .font(.system(size: 17))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
            horizontalScroll(width: 180, height: 120, spacing: -10, topList: true, resorce: top10)
        }
    }

    @ViewBuilder
    func horizontalScroll(width: CGFloat, height: CGFloat, spacing: CGFloat, topList: Bool? = false, resorce: [Any]) -> some View{
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: [GridItem(.adaptive(minimum: width), spacing: 10)], spacing: spacing) {
                ForEach(resorce.indices) { i in
                    HStack(spacing:0){
                        
                        //Numbers
                        if topList ?? false{
                            StrokeTextLabel(text: String(i+1))
                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                .zIndex(1)
                                .offset(x:22)
                        }
                        
                        //Image
                        Image(resorce[i] as! String)
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: height)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                    .offset(x: topList ?? false ? -25 : 0)
                }
            }
            .padding(.horizontal,20)
        }
    }
}


//MARK: Custom Shape
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct StrokeTextLabel: UIViewRepresentable {
    var text: String
    func makeUIView(context: Context) -> UILabel {
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment = NSTextAlignment.center
        let attributedString = NSAttributedString(
            string: text,
            attributes:[
                NSAttributedString.Key.paragraphStyle: attributedStringParagraphStyle,
                NSAttributedString.Key.strokeWidth: 3.0,
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.strokeColor: UIColor.white,
                NSAttributedString.Key.font: UIFont(name:"Helvetica", size:80.0)!
            ]
        )

        let strokeLabel = UILabel(frame: CGRect.zero)
        strokeLabel.attributedText = attributedString
        strokeLabel.backgroundColor = UIColor.clear
        strokeLabel.sizeToFit()
        strokeLabel.center = CGPoint.init(x: 0.0, y: 0.0)
        return strokeLabel
    }

    func updateUIView(_ uiView: UILabel, context: Context) {}
}
