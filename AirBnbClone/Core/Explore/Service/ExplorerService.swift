//
//  ExplorerService.swift
//  AirBnbClone
//
//  Created by Avijit bera on 14/03/25.
//

import Foundation

class ExploreService {
    func fetchListings()async throws -> [Listing] {
        return DeveloperPreview().listings
    }
}
