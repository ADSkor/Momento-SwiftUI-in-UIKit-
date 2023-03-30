//
//  TripsContentView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 29.03.2023.
//

import SwiftUI


enum ActiveNavigationDestination: Hashable {
    case tripListView(TripFilters, String)
    case detailView(Trip)
}

struct TripsContentView: View {
    
    @State private var searchText: String = ""
    @State private var isNewTripsSheetPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            
            if !searchText.isEmpty {
                TripsGridView(filter: TripFilters.title(searchText), title: "Search")
            } else {
                List {
                    RecentTripsSectionView()
                    FavoriteTripsSectionView()
                    CategoriesSectionView()
                }
                .listStyle(.plain)
                .navigationTitle("Momento")
                .navigationBarTitleDisplayMode(.large)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationDestination(for: ActiveNavigationDestination.self) { destination in
                    switch destination {
                    case .detailView(let trip):
                        TripDetailView(trip: trip)
                            .navigationBarTitle(trip.title)
                            .navigationBarTitleDisplayMode(.inline)
                    case .tripListView(let filter, let title):
                        TripsGridView(filter: filter, title: title)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isNewTripsSheetPresented = true
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
                .sheet(isPresented: $isNewTripsSheetPresented) {
                    let context = PersistenceController.shared.makeTaskContext()
                    let trip = Trip.newTrip(with: context)
                    TripEditView(trip: trip, taskContext: context)
                        .ignoresSafeArea()
                }

            }
        }
        .searchable(text: $searchText)
    }
}

struct TripsContentView_Previews: PreviewProvider {
    static var previews: some View {
        TripsContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.persistentContainer.viewContext)
    }
}
