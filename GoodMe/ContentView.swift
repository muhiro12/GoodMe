//
//  ContentView.swift
//  GoodMe
//
//  Created by Hiromu Nakano on 2020/04/09.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TaskView()
                .tabItem {
                    Image(systemName: "house")
            }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
