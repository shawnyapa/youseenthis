//
//  UserAboutMeField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct UserAboutMeField: View {
    @Binding var mode: UserEditMode
    @Binding var user: User
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ViewStrings.aboutMe):")
                        .font(.headline)
                    if mode == .view {
                        Text(user.aboutMe)
                            .font(.title)
                            .frame(height: 160)
                            .cornerRadius(16)
                    } else if mode == .edit || mode == .create {
                        TextField("\(ViewStrings.aboutMe)", text:$user.aboutMe)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(height: 150)
                            .cornerRadius(16)
                    }
                }
                Spacer()
            }
            .border(Color.clear)
            .padding([.top, .bottom])
            Divider()
        }
    }
}

struct UserAboutMeField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let user = userData.user
        UserAboutMeField(mode: .constant(UserEditMode.view), user: .constant(user))
    }
}
