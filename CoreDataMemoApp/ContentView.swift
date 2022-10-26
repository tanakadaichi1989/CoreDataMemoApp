//
//  ContentView.swift
//  CoreDataMemoApp
//
//  Created by 田中大地 on 2022/10/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "createdAt", ascending: true)],
        animation: .default)
    private var memos: FetchedResults<Memo>

    var body: some View {
        NavigationView {
            List {
                ForEach(memos) { memo in
                    VStack {
                        Text(memo.title ?? "タイトルなし")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity ,alignment: .leading)
                            .lineLimit(1)
                        Text(memo.stringUpdatedAt)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddMemoView()) {
                        Text("新規作成")
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
