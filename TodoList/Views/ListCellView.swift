//
//  ListCellView.swift
//  TodoList
//
//  Created by Bikram Singh on 22/07/24.
//

import SwiftUI

struct ListCellView: View {
    
    //MARK: - Public Properties
    
    let model: ItemModel
    
    //MARK: - View Body
    
    var body: some View {
        listCell
    }
}

#Preview {
    ListCellView(model: ItemModel(title: "1st", isCompleted: false))
}

extension ListCellView {
    
    private var listCell: some View {
        HStack {
            Image(systemName: model.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(model.isCompleted ? .green : .red)
            Text(model.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }
}
