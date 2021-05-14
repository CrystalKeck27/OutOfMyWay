//
//  Drive.swift
//  OutOfMyWay
//
//  Created by Tiger Coder on 4/19/21.
//

import Foundation

class Drive: Identifiable {
    
    var to, from: Location;
    
    var routes: [Route] = [];
    
    init(from: Location, to: Location) {
        self.from = from;
        self.to = to;
    }
}
