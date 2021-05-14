//
//  DriveRowView.swift
//  OutOfMyWay
//
//  Created by Tiger Coder on 4/19/21.
//

import SwiftUI

struct DriveRowView: View, Searchable, InitWith {
    
    typealias Obj = Drive
    var drive: Drive;
    
    init(_ obj: Drive) {
        drive = obj
    }
    
    func name() -> String {
        return "nya~";
    }
    
    
    
    var body: some View {
        Text("From: \(drive.from.val) \t To: \(drive.to.val)")
    }
}

struct DriveRowView_Previews: PreviewProvider {
    static var previews: some View {
        DriveRowView(Drive(from: Location(name: "Home"), to: Location(name: "Not Home")))
    }
}
