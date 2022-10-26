//
//  AddMemoView.swift
//  CoreDataMemoApp
//
//  Created by 田中大地 on 2022/10/26.
//

import SwiftUI

struct AddMemoView: View {
    @Environment(\.managedObjectContext) private var viewContent
    @Environment(\.presentationMode) var presentation
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        VStack {
            TextField("タイトル", text: $title)
                .font(.title)
            TextEditor(text: $content)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addMemo()
                } label: {
                    Text("保存")
                }

            }
        }
    }
    
    private func addMemo() {
        let memo = Memo(context: viewContent)
        memo.title = title
        memo.content = content
        memo.createdAt = Date()
        memo.updatedAt = Date()
        
        try? viewContent.save()
        presentation.wrappedValue.dismiss()
    }
}

struct AddMemoView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemoView()
    }
}
