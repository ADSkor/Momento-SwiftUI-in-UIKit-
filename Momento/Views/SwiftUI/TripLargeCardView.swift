//
//  TripLargeCardView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 29.03.2023.
//

import SwiftUI

struct TripLargeCardView: View {
    
    @ObservedObject var trip: Trip
    
    var body: some View {
        Image(uiImage: trip.heroImage ?? UIImage(systemName: noImageSymbol)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 340, height: 480)
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    Text(trip.title)
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .padding([.leading, .top, .trailing])
                        .lineLimit(1)
                    
                    Text(trip.formattedStartDate)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding([.leading, .bottom])
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.ultraThinMaterial)
            }
            .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
    }
}

struct TripLargeCardView_Previews: PreviewProvider {
    static var previews: some View {
        TripLargeCardView(trip: .preview)
    }
}
