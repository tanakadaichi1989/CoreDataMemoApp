//
//  EditMemoView.swift
//  CoreDataMemoApp
//
//  Created by 田中大地 on 2022/10/26.
//

import SwiftUI

struct EditMemoView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var title: String
    @State private var content: String
    private var memo: Memo
    
    init(memo: Memo) {
        self.memo = memo
        self.title = memo.title ?? ""
        self.content = memo.content ?? ""
    }
    
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
                    saveMemo()
                } label: {
                    Text("更新")
                }
            }
        }
    }
    
    private func saveMemo(){
        memo.title = title
        memo.content = content
        memo.updatedAt = Date()
        
        try? viewContext.save()
    }
}

struct EditMemoView_Previews: PreviewProvider {
    static var previews: some View {
        EditMemoView(memo: Memo())
    }
}
