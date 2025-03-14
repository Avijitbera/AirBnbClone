//
//  ExploreView.swift
//  AirBnbClone
//
//  Created by Avijit bera on 26/02/25.
//


import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExplorerViewModel(serive: ExploreService())
    
    var body: some View {
        NavigationStack {
            if(showDestinationSearchView){
                DestinationSearchView(show: $showDestinationSearchView)
            }else{
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack {
                        
                        ForEach(viewModel.listings, id: \.id){ listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self){ listing in
                    ListingDeatilsView(listing: listing)
                        .toolbar(.hidden)
                        .navigationBarBackButtonHidden()
                    
                }
            }
            
        }
    }
}


#Preview {
    ExploreView()
}
