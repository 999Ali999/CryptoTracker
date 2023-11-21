//
//  TopCoinsView.swift
//  CryptoTracker
//
//  Created by Ali on 21/11/23.
//

import SwiftUI

struct TopCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Coins")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topCoins) { coin in
                        TopCoinsItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TopCoinsView(viewModel: HomeViewModel())
}
