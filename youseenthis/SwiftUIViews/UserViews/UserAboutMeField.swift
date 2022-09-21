//
//  UserAboutMeField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct UserAboutMeField: View {
    var aboutMe: String
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ViewStrings.aboutMe):")
                        .font(.headline)
                    Text(aboutMe)
                        .font(.body)
                        .frame(height: 160)
                        .cornerRadius(16)
                        .multilineTextAlignment(.leading)
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
        UserAboutMeField(aboutMe: "I'm into Star Wars")
    }
}
