//
//  CategoriesSectionView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 30.03.2023.
//

import SwiftUI

struct CategoriesSectionView: View {
    var body: some View {
        Section {
            ForEach(TripCategory.allCases) { category in
                NavigationLink(value: ActiveNavigationDestination.tripListView(.category(category), category.rawValue)) {
                    Label(category.rawValue, systemImage: category.symbolName)
                }
            }
            .listSectionSeparator(.hidden, edges: .top)
        } header: {
            Text("Cagories")
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
        }
    }
}

struct CategoriesSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesSectionView()
    }
}
