//
//  TripsContentView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 29.03.2023.
//

import SwiftUI

struct TripsContentView: View {
    var body: some View {
        NavigationStack {
            List {
                RecentTripsSectionView()
                FavoriteTripsSectionView()
            }
            .listStyle(.plain)
            .navigationTitle("Momento")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationDestination(for: TripFilters.self) { filter in
                TripsGridView(filter: filter)
            }
        }
    }
}

struct TripsContentView_Previews: PreviewProvider {
    static var previews: some View {
        TripsContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.persistentContainer.viewContext)
    }
}
