//
//  DetailView.swift
//  Test
//
//  Created by Bora Erdem on 15.09.2022.
//

import SwiftUI

struct DetailView: View {
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading){
                VStack{
                    headerImage
                    Spacer()
                }
                
                ScrollView(showsIndicators: false){
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 350)
                    
                    VStack(alignment: .leading){
                        movieTitle
                        mainButtons
                        secondaryButtnos
                        VStack(alignment: .leading, spacing: 5){
                            Text("Joker, başarısız bir komedyen olan Arthur Fleck'in hayatına odaklanıyor. Toplum tarafından dışlanan bir adam olan Arthur, hayatta yapayalnızdır. Sürekli bir bağ kurma arayışında olan Arthur, yaşamını taktığı iki maske ile geçirir.")
                            Text("IMDB 8.6").bold()
                            Text("Drama · Gerilim").bold()
                        }
                        .padding()
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                    }
                }
                .padding()
                backButton
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .preferredColorScheme(.dark)
    }
}

extension DetailView{
    private var headerImage: some View{
        ZStack(alignment: .topLeading){
            Image("joker")
                .resizable()
                .scaledToFill()
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
            

        }
        .frame(height: 350)

    }
    
    private var backButton: some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .padding()
                .foregroundColor(.red)
                .background(in: Circle())
                .padding(.top,60)
                .padding(.leading,20)
        }
    }
    
    private var movieTitle: some View{
        VStack(alignment: .leading){
            Text("Joker")
                .font(.system(size: 32))
                .frame(maxWidth: .infinity,alignment: .leading)
            Text("Türkiye'de #5 numara")
                .font(.system(size: 13))
                .foregroundColor(.secondary)
        }
    }
    
    private var mainButtons: some View{
        VStack{
            HStack{
                Image(systemName: "play.fill")
                Text("Şimdi İzle")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.red, in: RoundedRectangle(cornerRadius: 10))
            HStack{
                Image(systemName: "tray.and.arrow.down")
                Text("İndir")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.secondary, in: RoundedRectangle(cornerRadius: 10).stroke())
        }
        .padding(.vertical)
    }
    
    private var secondaryButtnos: some View{
        HStack(alignment: .top, spacing:40){
            Spacer()
            VStack(spacing: 5){
                Image(systemName: "airplayvideo")
                    .font(.title)
                    .frame(width: 35, height: 35)
                Text("Fragman")
                    .font(.system(size: 13))
            }
            VStack(spacing: 5){
                Image(systemName: "plus")
                    .font(.title)
                    .frame(width: 35, height: 35)
                Text("Listem")
                    .font(.system(size: 13))
            }
            VStack(spacing: 5){
                Image(systemName: "ellipsis.rectangle")
                    .font(.title)
                    .frame(width: 35, height: 35)
                Text("Dahası")
                    .font(.system(size: 13))
            }
            Spacer()
        }
    }
}
