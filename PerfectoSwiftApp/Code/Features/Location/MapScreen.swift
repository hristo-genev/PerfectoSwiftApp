//
//  Map.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 16.01.24.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: LocationHelper.currentLocation,
        span: MKCoordinateSpan(latitudeDelta: MapDefaultCoordinates.zoom, longitudeDelta: MapDefaultCoordinates.zoom))
            

    var body: some View {
        VStack {

            if LocationHelper.authorized == CLAuthorizationStatus.authorizedAlways || LocationHelper.authorized == CLAuthorizationStatus.authorizedWhenInUse {
                                    
                Text("You are here:")
                    .fontWeight(.light)
                    .font(.title)
                Text("\(region.center.latitude), \(region.center.longitude)")
                    .accessibilityIdentifier("MapScreen.locationTxt")
                
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .padding()
                    .accessibilityIdentifier("MapScreen.userLocationMap")
                
            } else {
                
                Text("Location access not permitted!")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .accessibilityIdentifier("MapScreen.locationErrorMsg")
                Text("Please allow location access in device settings!")
                    .font(.subheadline)
            }
        }
    }
}


struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
