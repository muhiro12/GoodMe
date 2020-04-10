//
//  TaskListView.swift
//  GoodMe
//
//  Created by Hiromu Nakano on 2020/04/09.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.date, ascending: false)]
    ) var items: FetchedResults<Item>

    var body: some View {
        List {
            ForEach(items) { item in
                TaskListItemView(item: item)
            }.onDelete(perform: delete)
        }
    }

    private func delete(indexSet: IndexSet) {
        print("delete")
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
