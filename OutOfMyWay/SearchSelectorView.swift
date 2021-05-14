//
//  SearchSelector.swift
//  OutOfMyWay
//
//  Created by Tiger Coder on 4/19/21.
//

import SwiftUI

protocol InitWith {
    associatedtype Obj;
    init(_ obj: Obj);
}

protocol Searchable {
    func name() -> String
}

struct SearchSelectorView<V: View & InitWith>: View where V.Obj: Identifiable & Hashable & Searchable {
    private var callbacks: Array<(V.Obj) -> Void> = [];
    @State private var selection: V.Obj?
    @State private var searchString: String = "";
    var allObjs: [V.Obj];
    
    init(objs: [V.Obj]) {
        allObjs = objs;
    }
    
    func selected() -> V.Obj? {
        return selection;
    }
    
    func onSelect(_ callback: @escaping (V.Obj) -> Void) -> Self  {
        var modified = self;
        modified.callbacks.append(callback);
        return modified;
    }
    
    func fire() {
        for callback in callbacks {
            callback(selection!);
        }
    }
    
    var body: some View {
        VStack {
            TextField("Start typing...", text: $searchString)
                .padding(.all)
            List {
                ForEach(allObjs.filter({
                    searchString.isEmpty ? true : $0.name().lowercased().contains(searchString.lowercased())
                    
                }), id: \.self) { obj in
                    ZStack {
                        HStack {
                            if(obj == selection) {
                                Image(systemName: "chevron.right").foregroundColor(.accentColor);
                            }
                            
                            V(obj).zIndex(1);
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if(selection != obj) {
                                selection = obj;
                                fire();
                            } else {
                                selection = nil;
                            }
                        }
                        .animation(.spring());
                    }
                }
            }
            .animation(.linear)
            .padding(.all, 0.0)
        }
    }
}

struct SearchSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSelectorView<LocationRowView>(objs: [
            Location(name: "Home"),
            Location(name: "Not Home"),
            Location(name: "Here"),
            Location(name: "There"),
            Location(name: "To the left"),
            Location(name: "Take it back now y'all")
        ]);
    }
}
