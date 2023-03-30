//
//  TripEditView.swift
//  Momento
//
//  Created by Aleksandr Skorotkin on 30.03.2023.
//

import SwiftUI
import CoreData

//UIkit ViewController inside SwiftUI
struct TripEditView: UIViewControllerRepresentable {
    
    var trip: Trip
    var taskContext: NSManagedObjectContext
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let tripEditController = TripEditController(with: trip, context: taskContext)
        let navigationCotroller = UINavigationController(rootViewController: tripEditController)
        return navigationCotroller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {}
}

