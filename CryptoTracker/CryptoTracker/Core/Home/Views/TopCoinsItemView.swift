//
//  TopCoinsItemView.swift
//  CryptoTracker
//
//  Created by Ali on 21/11/23.
//

import SwiftUI
import Kingfisher

struct TopCoinsItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .center) {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
            
            Text(coin.symbol.uppercased())
                .font(.caption)
                .fontWeight(.bold)

        
            VStack(spacing: 3) {
                                
                Text(coin.currentPrice.toCurrency())
                    .font(.title3)
                    .foregroundStyle(.gray)
            }.padding(.top, 5)
            
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.subheadline)
                .bold()
                .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            
        }
        .frame(width: 130, height: 130)
        .background(Color("TopCoinBackgroundColor"))
        .cornerRadius(10)
    }
}

//#Preview {
//    TopCoinsItemView()
//}
