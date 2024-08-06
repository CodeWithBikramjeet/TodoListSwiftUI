//
//  AddItemView.swift
//  TodoList
//
//  Created by Bikram Singh on 22/07/24.
//

import SwiftUI

struct AddItemView: View {
    
    //MARK: - Private Properties
    
    private let alertTitle: String = "Your item name must be greater than 3 characters 😤"
    @State private var itemTitle: String = ""
    @State private var showAlert: Bool =  false
    @Environment(\.presentationMode) private var presentedMode
    
    //MARK: - Public Properties
    
    @ObservedObject var listViewModel: ListViewModel
    
    //MARK: - View Body
    
    var body: some View {
        VStack {
            showTextField
            showAddButton
            Spacer()
        }
        .padding(14)
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    //MARK: - Private Methods
    
    private func saveButtonPressed() {
        if textIsAppropriate() {
            self.listViewModel.addItem(itemModel: ItemModel(title: itemTitle, isCompleted: false))
            self.presentedMode.wrappedValue.dismiss()
        }
    }
    
    private func textIsAppropriate()-> Bool {
        if itemTitle.count < 3 {
            showAlert.toggle()
            return false
        }
        return true
    }
    
    private func getAlert()-> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddItemView(listViewModel: ListViewModel())
    }
}


extension AddItemView {
    
    private var showTextField: some View {
        TextField("Type something here...", text: $itemTitle)
            .padding(10)
            .frame(height: 50)
            .background(Color(uiColor: .lightGray).opacity(0.2))
            .cornerRadius(10.0)
    }
    
    private var showAddButton: some View {
        Button(action: {
            self.saveButtonPressed()
        }, label: {
            Text("Add")
        })
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10.0)
        .padding(.top, 10)
    }
    
}
