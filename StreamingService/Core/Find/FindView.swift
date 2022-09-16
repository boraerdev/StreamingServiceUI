//
//  FindView.swift
//  Test
//
//  Created by Bora Erdem on 15.09.2022.
//

import SwiftUI

struct FindView: View {
    
    //MARK: Def
    @State var searchText: String = ""
    
    
    //MARK: FakeData
    private let turler: [TurModel] = [
        TurModel(title: "Tümü", image: "star"),
        TurModel(title: "Filmler", image: "play.tv"),
        TurModel(title: "Diziler", image: "appletvremote.gen4"),
        ]
    private let turlerList: [TurModel] = [
        TurModel(title: "Aksiyon", image: "joker"),
        TurModel(title: "Komedi", image: "matrix"),
        TurModel(title: "Korku", image: "us"),
        TurModel(title: "Dram", image: "v1"),
    ]
    
    
    //MARK: UI
    var body: some View {
        NavigationView {
                VStack{
                    searchBar
                    turLine
                    kesfetTitle
                    ScrollView{turlerListView}
                    Spacer()
                }
            .navigationBarHidden(true)
            
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
            .preferredColorScheme(.dark)
    }
}


//MARK: UI
extension FindView{
    
    private var searchBar: some View{
        TextField("Search...", text: $searchText)
            .padding(.vertical,16).padding(.horizontal,16)
            .background(.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
    
    private var turLine: some View{
        LazyHGrid(rows: [GridItem(.adaptive(minimum: (UIScreen.main.bounds.width - 20)/3), spacing: 10)], spacing: 10) {
            ForEach(turler, id: \.image) { tur in
                let width: CGFloat = (UIScreen.main.bounds.width - 20)
                RoundedRectangle(cornerRadius: 15,style: .continuous)
                    .fill((.secondary.opacity(0.15)))
                    .frame(width: width/3, height: width/3)
                    .overlay {
                        VStack(spacing:10){
                            Image(systemName: tur.image)
                                .font(.largeTitle)
                            Text(tur.title)
                            
                        }
                    }
                    
            }
        }
        
    }
    
    private var kesfetTitle: some View{
        Text("Keşfet").frame(maxWidth: .infinity,alignment: .leading).padding(.horizontal)
    }
    
    private var turlerListView: some View{
        VStack{
            ForEach(turlerList) { model in
                ZStack(alignment: .bottomLeading){
                    Image(model.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .leading, endPoint: .trailing)
                    Text(model.title)
                        .padding()
                        .font(.system(size: 22, weight: .bold))
                }

            }
        }
    }
    
}
