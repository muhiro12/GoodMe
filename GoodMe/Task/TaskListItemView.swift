//
//  TaskListItemView.swift
//  GoodMe
//
//  Created by Hiromu Nakano on 2020/04/09.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct TaskListItemView: View {
    @Environment(\.managedObjectContext) var context

    let item: Item

    var body: some View {
        HStack {
            Text(DateConverter().convert(item.date))
                .frame(width: 80)
            Divider()
            Text(item.content ?? "")
            Spacer()
            Divider()
            Text(item.good.description)
                .frame(width: 40)
        }.foregroundColor(item.done ? .gray : .primary)
    }
}

struct TaskListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListItemView(item: Item())
    }
}
