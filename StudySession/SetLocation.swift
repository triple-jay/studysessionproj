//
//  LocationAnnotation.swift
//  StudySession
//
//  Created by Christy Song on 11/17/19.
//  Copyright © 2019 Christy Song. All rights reserved.
//

import Foundation
import MapKit

class SetLocation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
      self.title = title
      self.locationName = locationName
      self.discipline = discipline
      self.coordinate = coordinate
      
      super.init()
    }
    
    var subtitle: String? {
      return locationName
    }
}
