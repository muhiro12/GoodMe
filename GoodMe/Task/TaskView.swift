//
//  TaskView.swift
//  GoodMe
//
//  Created by Hiromu Nakano on 2020/04/09.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.managedObjectContext) var context

    @State private var isPresented = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskListView()
            FloatingCircleButtonView {
                self.isPresented = true
            }
        }.sheet(isPresented: $isPresented) {
            TaskCreateView()
                .environment(\.managedObjectContext, self.context)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
