//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Ali on 21/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    
    private func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                TopCoinsView(viewModel: viewModel)
                
                Divider()
                
                AllCoinsView(viewModel: viewModel)
                
            }
            .navigationTitle(Text(getFormattedDate()))
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
