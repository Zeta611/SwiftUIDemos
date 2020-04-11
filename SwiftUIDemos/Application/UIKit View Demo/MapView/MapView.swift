//
//  MapView.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var center: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setCenter(center, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, MKMapViewDelegate {
        private let parent: MapView

        func mapView(
            _ mapView: MKMapView,
            regionDidChangeAnimated animated: Bool
        ) {
            parent.center = mapView.centerCoordinate
        }

        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            center: .constant(
                CLLocationCoordinate2D(latitude: 37, longitude: 127)
            )
        )
    }
}
