//
//  TripDetailView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 30.03.2023.
//

import SwiftUI

//UIkit ViewController inside SwiftUI
struct TripDetailView: UIViewControllerRepresentable {
    
    var trip: Trip
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return TripDetailViewController(with: trip)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {}
}
