//
//  MultiLineNotesView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 21.03.2023.
//

import SwiftUI

struct MultiLineNotesView: View {
    
    @ObservedObject var trip: Trip
    
    var body: some View {
        TextField(
            "Notes",
            text: $trip.notes,
            axis: .vertical)
        .lineLimit(1...10)
    }
}

struct MultiLineNotesView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineNotesView(trip: .preview)
    }
}
