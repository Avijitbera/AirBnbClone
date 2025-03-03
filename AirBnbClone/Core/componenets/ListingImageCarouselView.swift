//
//  ListingImageCarouselView.swift
//  AirBnbClone
//
//  Created by Avijit bera on 01/03/25.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
        "image-1",
        "image-2",
        "image-3",
        "image-4"
    ]
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            
    }
}

#Preview {
    ListingImageCarouselView()
}
