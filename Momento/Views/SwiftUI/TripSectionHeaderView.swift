//
//  TripSectionHeaderView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 30.03.2023.
//

import SwiftUI

struct TripSectionHeaderView: View {
    
    var sectionTitle: String = "Trips"
    var sectionFilter: TripFilters = .all
    var navigationTitle = "Trips"
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
            Spacer()
            NavigationLink(value: sectionFilter) {
                Text("See All")
            }
        }
    }
}

struct TripSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TripSectionHeaderView()
    }
}
