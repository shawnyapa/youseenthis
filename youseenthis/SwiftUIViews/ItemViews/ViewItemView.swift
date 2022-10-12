//
//  ItemDetail.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct ViewItemView: View {
    @State private var showCreateItem: Bool = false
    @ObservedObject var viewItemVM: ViewItemViewModel
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ItemTitleField(item: viewItemVM.item)
                ItemTypeField(item: viewItemVM.item)
                ItemStatusField(item: viewItemVM.item)
                ItemRatingField(item: viewItemVM.item)
                ItemTagsField(item: viewItemVM.item)
                ItemNotesField(item: viewItemVM.item)
                Spacer()
            }
            .padding(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showCreateItem.toggle()
                    }, label: {
                        Image(systemName: SystemImage.duplicate.rawValue)
                            .font(.system(.title))
                            .frame(width: 67, height: 60)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                            .offset(x:0.0, y:4.0)
                    })
                    .background(SystemColors.dankyAccentColor)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
            }
        }
        .sheet(isPresented: $showCreateItem) {
            CreateItemView(showCreateItem: $showCreateItem, createItemVM: viewItemVM.createCreateItemViewModel())
        }
        .alert(viewItemVM.createAlertMessage, isPresented: $viewItemVM.showCreateAlert) {
            Button("OK", role: .cancel) {
                viewItemVM.showCreateAlert.toggle()
            }
        }
    }
}


struct ViewItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item.defaultValue()
        let exampleUser = User.sampleValue()
        ViewItemView(viewItemVM: ViewItemViewModel(item: item, loggedInUser: exampleUser))
    }
}
