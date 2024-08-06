//
//  ListView.swift
//  TodoList
//
//  Created by Bikram Singh on 22/07/24.
//

import SwiftUI

struct ListView: View {
    
    //MARK: - Private Properties
    
    @StateObject private var listViewModel = ListViewModel()

    //MARK: - View Body
    
    var body: some View {
        NavigationStack {
            VStack {
                showListView
            }
            .navigationTitle("Todo List")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddItemView( listViewModel: listViewModel))
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}

extension ListView {
    
    private var showListView: some View {
        List {
            ForEach(self.listViewModel.itemModelsArray) { item in
                Button(action: {
                    self.listViewModel.updateItem(itemModel: item)
                }, label: {
                    ListCellView(model: item)
                })
                .padding(0)
            }
            .onDelete(perform:self.listViewModel.deleteItem)
            .onMove(perform: self.listViewModel.moveItem)
            .listStyle(.plain)
        }
    }
    
}
