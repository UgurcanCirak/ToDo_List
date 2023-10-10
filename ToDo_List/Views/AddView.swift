//
//  AddView.swift
//  ToDo_List
//
//  Created by Uğurcan Çırak on 30.09.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type in something ", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.yellow)
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: { Text("Save".uppercased())
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new items must be t least 3 characters long ‼️ "
            showAlert.toggle()
            
            return false
        }
        return true
    }
        func getAlert() -> Alert {
            return Alert(title: Text(alertTitle))}
    
    }
                         
                         

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
