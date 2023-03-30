//
//  FavoriteTripsSectionView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 30.03.2023.
//

import SwiftUI

struct FavoriteTripsSectionView: View {
    
    @FetchRequest(fetchRequest: Trip.recentFavoriteTripsRequest()) private var favoriteTrips: FetchedResults <Trip>
    
    var body: some View {
        Section {
            TripHorizontalListView(
                fetchRequest: Trip.recentFavoriteTripsRequest(),
                cardSize: .regularCard)
        } header: {
            TripSectionHeaderView(sectionTitle: "Favorites", sectionFilter: .favorite)
        }
    }
}

struct FavoriteTripsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTripsSectionView()
    }
}
