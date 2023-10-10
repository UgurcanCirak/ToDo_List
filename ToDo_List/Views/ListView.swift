//
//  ListView.swift
//  ToDo_List
//
//  Created by Uğurcan Çırak on 30.09.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                Text(" 'To see the possibilities of the border got to try the impossible.' FSM ")
                    .font(.headline)
                    .italic()
                    .frame(maxWidth: 250)
                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    
                    
            }
            else{
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                        //ListRowView (title: item)}
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
            }
        }
            .navigationTitle("📓 ToDo List ✍🏻")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add", destination: AddView() )
            )
        }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
                ListView()
            }
            .environmentObject(ListViewModel())
        }
    }
    
}
