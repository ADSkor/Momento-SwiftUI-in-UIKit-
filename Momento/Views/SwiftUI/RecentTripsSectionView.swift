//
//  RecentTripsSectionView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 29.03.2023.
//

import SwiftUI

struct RecentTripsSectionView: View {
    
    @FetchRequest(fetchRequest: Trip.recentTripsRequest()) private var recentTrips: FetchedResults <Trip>
    
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(recentTrips) { trip in
                        TripLargeCardView(trip: trip)
                    }
                }
                .padding([.leading, .trailing])
            }
            .scrollIndicators(.hidden)
            .listSectionSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        } header: {
            Text("Recent Trips")
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
        }
    }
}

struct RecentTripsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTripsSectionView()
    }
}
