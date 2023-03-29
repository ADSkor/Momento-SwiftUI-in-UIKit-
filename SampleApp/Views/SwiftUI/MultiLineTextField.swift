//
//  MultiLineTextField.swift
//  SampleApp
//
//  Created by Aleksandr Skorotkin on 21.03.2023.
//

import SwiftUI

struct MultiLineTextField: View {
    
    @ObservedObject var trip: Trip
    
    var body: some View {
        TextField(
            "Notes",
            text: $trip.notes,
            axis: .vertical)
        .lineLimit(1...10)
    }
}

struct MultiLineTextField_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineTextField(trip: .preview)
    }
}
