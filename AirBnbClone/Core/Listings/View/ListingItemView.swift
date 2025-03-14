//
//  ListingItemView.swift
//  AirBnbClone
//
//  Created by Avijit bera on 26/02/25.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8){
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack{
                VStack(alignment: .leading) {
                    Text("\(listing.city), Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
       
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview().listings[0])
}
