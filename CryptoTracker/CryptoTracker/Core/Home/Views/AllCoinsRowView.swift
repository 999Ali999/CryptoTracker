//
//  AllCoinsRowView.swift
//  CryptoTracker
//
//  Created by Ali on 21/11/23.
//

import SwiftUI
import Kingfisher

struct AllCoinsRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundStyle(.gray)
            
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.toPercent())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        
    }
}

#Preview {
    AllCoinsRowView(coin: Coin(
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
