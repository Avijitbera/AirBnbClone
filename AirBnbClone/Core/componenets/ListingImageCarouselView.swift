//
//  ListingImageCarouselView.swift
//  AirBnbClone
//
//  Created by Avijit bera on 01/03/25.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    var body: some View {
        TabView {
            ForEach(listing.imageUrls, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview().listings[0])
}
