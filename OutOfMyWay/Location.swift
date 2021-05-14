//
//  Location.swift
//  OutOfMyWay
//
//  Created by Tiger Coder on 4/19/21.
//

import Foundation

class Location: Identifiable, Hashable, Searchable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.val == rhs.val;
    }
    
    var val: String;
    
    init(name: String) {
        self.val = name;
    }
    
    func name() -> String {
        return val;
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(val);
    }
}
