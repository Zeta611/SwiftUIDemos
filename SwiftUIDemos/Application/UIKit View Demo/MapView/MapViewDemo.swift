//
//  MapViewDemo.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import MapKit
import SwiftUI

struct MapViewDemo: View {
    @State var latitude: Double = 37.44845
    @State var longitude: Double = 126.95246

    private var latitudeString: Binding<String> {
        Binding<String>(
            get: { String(format: "%.4f", self.latitude) },
            set: {
                if let newLatitude = Double($0) {
                    DispatchQueue.main.async {
                        self.latitude = newLatitude
                    }
                }
            }
        )
    }

    private var longitudeString: Binding<String> {
        Binding<String>(
            get: { String(format: "%.4f", self.longitude) },
            set: {
                if let newLongitude = Double($0) {
                    DispatchQueue.main.async {
                        self.longitude = newLongitude
                    }
                }
            }
        )
    }

    private var location: Binding<CLLocationCoordinate2D> {
        Binding<CLLocationCoordinate2D>(
            get: {
                CLLocationCoordinate2D(
                    latitude: CLLocationDegrees(self.latitude),
                    longitude: CLLocationDegrees(self.longitude)
                )
            },
            set: { coordinate in
                DispatchQueue.main.async {
                    self.latitude = coordinate.latitude
                    self.longitude = coordinate.longitude
                }
            }
        )
    }

    var body: some View {
        VStack {
            HStack {
                Text("Latitude")
                TextField("Latitude", text: latitudeString)
                    .fixedSize()

                Text("Longitude")
                TextField("Longitude", text: longitudeString)
                    .fixedSize()
            }
            .padding()

            MapView(center: location)
                .frame(height: UIScreen.main.bounds.height - 120)
        }
    }
}

struct MapViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        MapViewDemo()
    }
}
