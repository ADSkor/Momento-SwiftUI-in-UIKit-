//
//  TripHorizontalListView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 30.03.2023.
//

import SwiftUI
import CoreData

enum TripCardSize {
    case largeCard
    case regularCard
}

struct TripHorizontalListView: View {
    @FetchRequest private var trips: FetchedResults<Trip>
    private let tripCardSize: TripCardSize
    
    init(fetchRequest: NSFetchRequest<Trip>, cardSize: TripCardSize) {
        _trips = FetchRequest(fetchRequest: fetchRequest)
        tripCardSize = cardSize
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(trips) { trip in
                    NavigationLink(value: ActiveNavigationDestination.detailView(trip)) {
                        switch tripCardSize {
                        case .largeCard:
                            TripLargeCardView(trip: trip)
                        case .regularCard:
                            TripCardView(trip: trip)
                        }
                    }
                }
            }
            .padding([.leading, .trailing])
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        .listSectionSeparator(.hidden)
        .scrollIndicators(.hidden)
    }
}
