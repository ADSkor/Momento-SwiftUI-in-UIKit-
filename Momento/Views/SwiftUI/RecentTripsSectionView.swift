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
            TripHorizontalListView(
                fetchRequest: Trip.recentTripsRequest(),
                cardSize: .largeCard)
        } header: {
            TripSectionHeaderView(sectionTitle: "Recent Trips", sectionFilter: .all)
        }
    }
}

struct RecentTripsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTripsSectionView()
    }
}
