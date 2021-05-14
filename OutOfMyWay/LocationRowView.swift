//
//  LocationRowView.swift
//  OutOfMyWay
//
//  Created by Tiger Coder on 4/19/21.
//

import SwiftUI

struct LocationRowView: View, InitWith {
    typealias Obj = Location;
    var location: Location;
    
    init(_ location: Location) {
        self.location = location;
    }
    
    var body: some View {
        HStack {
            Text(location.val);
            Spacer();
        }
    }
}

struct LocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRowView(Location(name: "There"));
    }
}
