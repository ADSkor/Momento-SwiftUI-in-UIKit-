//  Momento
//
//  Created by Aleksandr Skorotkin on 21.03.2023.
//
//  Abstract:
//  MKPlacement extension to get the formatted address.


import MapKit
import Contacts

extension MKPlacemark {

    var formattedAddress: String? {
        guard let postalAddress else { return nil }
        return CNPostalAddressFormatter
            .string(from: postalAddress, style: .mailingAddress)
            .replacingOccurrences(of: "\n", with: " ")
    }
}
