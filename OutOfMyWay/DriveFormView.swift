//
//  DriveFormView.swift
//  OutOfMyWay
//
//  Created by Tiger Coder on 5/14/21.
//

import SwiftUI

struct DriveFormView: View {
    private let locations = [
        Location(name: "Home"),
        Location(name: "Not Home"),
        Location(name: "Here"),
        Location(name: "There"),
        Location(name: "To the left"),
        Location(name: "Take it back now y'all")
    ];
    @State private var isShowingDestinationView = false;
    @State private var isShowingNextView = false;
    @State private var origin: Location? = nil;
    @State private var destination: Location? = nil;
    @State private var time: Date = Date();
    @State private var text = Text("hey");
    
    var body: some View {
        NavigationView() {
            originView
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var originView: some View {
        VStack {
            NavigationLink(destination: destinationView(origin), isActive: $isShowingDestinationView) {
                EmptyView()
            }
            SearchSelectorView<LocationRowView>(
                objs: locations
            ).onSelect { location in
                origin = location;
                isShowingDestinationView = true;
            }
        }
        .navigationTitle("Origin")
    }
    
    func destinationView(_ origin: Location?) -> some View {
        return
            VStack {
                NavigationLink(destination: metapanelView, isActive: $isShowingNextView) {
                    EmptyView()
                }
                SearchSelectorView<LocationRowView>(
                    objs: locationsWithout(origin)
                ).onSelect { location in
                    isShowingNextView = true;
                    destination = location;
                }
            }.navigationTitle("Destination")
    }
    
    func locationsWithout(_ without: Location?) -> [Location] {
        var locationsCopy = locations;
        if (without != nil) {
            locationsCopy.removeAll {$0.name() == without!.name()}
        }
        return locationsCopy;
    }
    
    var metapanelView: some View {
        VStack {
            VStack {
                DatePicker("Departure Time", selection: $time, displayedComponents: .hourAndMinute)
                DatePicker("Arrival Time", selection: $time, displayedComponents: .hourAndMinute)
            }
            .padding();
        }
    }
}

struct DriveFormView_Previews: PreviewProvider {
    static var previews: some View {
        DriveFormView()
    }
}
