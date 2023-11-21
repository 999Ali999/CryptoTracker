//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by Ali on 21/11/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topCoins = [Coin]()
    
    init() {
        fetchAPI()
    }
    
    func fetchAPI() {
        let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&locale=en"
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                
                DispatchQueue.main.async {
                    self.coins = coins
                    self.getTopCoins()
                }
                
            } catch let error {
                print("Error: \(error)")
            }
        }
        .resume()
    }
    
    func getTopCoins() {
        let topFiveCoins = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topCoins = Array(topFiveCoins.prefix(10))
    }
}
