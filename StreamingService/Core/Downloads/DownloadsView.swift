//
//  DownloadsView.swift
//  Test
//
//  Created by Bora Erdem on 15.09.2022.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        VStack{
            Image(systemName: "tray.and.arrow.down")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            Text("Henüz hiçbir şey indirmediniz.")
                .padding()
        }
        
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
            .preferredColorScheme(.dark)
    }
}
