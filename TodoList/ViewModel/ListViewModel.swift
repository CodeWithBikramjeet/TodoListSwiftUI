//
//  ListViewModel.swift
//  TodoList
//
//  Created by Bikram Singh on 23/07/24.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    //MARK: - Public Properties
    
    @Published var itemModelsArray: [ItemModel] = []
    
    //MARK: - View Init Methods
    
    init() {
        self.setIntialDummyData()
    }
    
    //MARK: - Private Methods
    
    private func setIntialDummyData() {
        self.itemModelsArray = [
            ItemModel(title: "This is 1 title!", isCompleted: false),
            ItemModel(title: "This is 2 title!", isCompleted: true),
            ItemModel(title: "This is 3 title!", isCompleted: false),
            ItemModel(title: "This is 4 title!", isCompleted: false),
            ItemModel(title: "This is 5 title!", isCompleted: true)
        ]
    }
    
    //MARK: - Public Methods
    
    func deleteItem(indexSet: IndexSet) {
        itemModelsArray.remove(atOffsets: indexSet)
    }
    
    func addItem(itemModel: ItemModel) {
        itemModelsArray.append(itemModel)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        itemModelsArray.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(itemModel: ItemModel) {
        if let index = itemModelsArray.firstIndex(where: {$0.id == itemModel.id}) {
            self.itemModelsArray[index].isCompleted.toggle()
        }
    }
    
}
