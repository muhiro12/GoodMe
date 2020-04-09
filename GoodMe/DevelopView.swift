//
//  DevelopView.swift
//  GoodMe
//
//  Created by Hiromu Nakano on 2020/04/09.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct DevelopView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.date, ascending: false)]
    ) var items: FetchedResults<Item>

    @State private var content = ""
    @State private var done = false
    @State private var good = 0

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 8)
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
            List {
                ForEach(items) { item in
                    Row(item: item)
                }
            }
        }
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

    struct Row: View {
        var item: Item

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
                Divider()
            }.foregroundColor(item.done ? .gray : .primary)
        }
    }

    struct DateConverter {
        func convert(_ date: Date?) -> String {
            guard let date = date else {
                return ""
            }
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: date)
        }
    }
}

struct DevelopView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopView()
    }
}

extension Item: Identifiable {}
