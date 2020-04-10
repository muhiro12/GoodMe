//
//  TaskCreateView.swift
//  GoodMe
//
//  Created by Hiromu Nakano on 2020/04/09.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct TaskCreateView: View {
    @Environment(\.managedObjectContext) var context

    @State private var content = ""
    @State private var done = false
    @State private var good = 0

    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            TextField("Content", text: $content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            Button(action: {
                self.done.toggle()
            }, label: {
                Text("done")
                    .foregroundColor(done ? .gray : .primary)
            })
            Divider()
            Button(action: {
                self.good += 1
            }, label: {
                Text(good.description)
            })
            Divider()
            Button(action: add) {
                Text("Add")
            }
            Spacer()
                .frame(width: 20)
        }.frame(height: 40)
    }

    private func add() {
        guard !content.isEmpty else {
            return
        }

        let item = Item(context: context)
        item.date = Date()
        item.content = content
        item.done = done
        item.good = Int16(good)

        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct TaskCreateView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreateView()
    }
}
