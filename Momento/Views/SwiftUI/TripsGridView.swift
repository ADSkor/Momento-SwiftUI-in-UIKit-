//
//  TripsGridView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 30.03.2023.
//

import SwiftUI

struct TripsGridView: View {
    
    @FetchRequest private var trips: FetchedResults<Trip>
    private var navigationTitle: String
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible())
    ]
    
    init(filter: TripFilters, title: String = "Trips") {
        let request = Trip.fetchRequest()
        request.predicate = filter.predicate()
        request.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        _trips = FetchRequest(fetchRequest: request)
        navigationTitle = title
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(trips) { trip in
                    NavigationLink(value: ActiveNavigationDestination.detailView(trip)) {
                        TripCardView(trip: trip)
                    }
                }
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TripsGridView_Previews: PreviewProvider {
    static var previews: some View {
        TripsGridView(filter: .all)
    }
}
