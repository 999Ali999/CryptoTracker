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

#Preview {
    TopCoinsItemView(coin:  Coin(
        id: "abc123",
        symbol: "XYZ",
        name: "RandomCoin",
        image: "https://randomcoinimage.com",
        currentPrice: 42.0,
        marketCapRank: 10,
        marketCap: 1000000000.0,
        fullyDilutedValuation: 1200000000.0,
        totalVolume: 5000000.0,
        high24H: 45.0,
        low24H: 40.0,
        priceChange24H: 2.0,
        priceChangePercentage24H: 5.0,
        marketCapChange24H: 50000000.0,
        marketCapChangePercentage24H: 5.0,
        circulatingSupply: 90000000.0,
        totalSupply: 100000000.0,
        maxSupply: 150000000.0,
        ath: 50.0,
        athChangePercentage: 20.0,
        athDate: "2023-11-21",
        atl: 30.0,
        atlChangePercentage: -10.0,
        atlDate: "2023-11-20",
        lastUpdated: "2023-11-21",
        sparklineIn7D: SparklineIn7D(price: [40.0, 42.0, 45.0, 43.0, 41.0, 44.0, 42.0])
    )
)
}
