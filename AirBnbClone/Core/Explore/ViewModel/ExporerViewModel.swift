//
//  Exporer.swift
//  AirBnbClone
//
//  Created by Avijit bera on 14/03/25.
//

import Foundation

class ExplorerViewModel: ObservableObject {
    @Published var listings = [Listing ]()
    private let servicce: ExploreService
    
    init(serive: ExploreService){
        self.servicce = serive
        Task { await fetchListing() }
    }
    
    func fetchListing()async{
        do {
            self.listings = try await servicce.fetchListings()
        }catch{
            
        }
    }
}
