//
//  EmailButton.swift
//  youseenthis
//
//  Created by Shawn Yapa on 5/8/22.
//

import SwiftUI

struct EMailButton: View {
    @State private var showingMail = false
    @Binding var emailAddress: String
    let emailAddressText = "Email:"
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(emailAddressText)
                    .frame(width: 100.0, height: 50.0)
                    .fixedSize(horizontal: true, vertical: true)
                Divider()
                TextField(emailAddressText, text: $emailAddress)
            }
            .padding([.leading, .trailing])
            Button("Send Data by Email") {
                self.showingMail.toggle()
            }
        }
        .sheet(isPresented: $showingMail) {
            MailComposeViewController(toRecipients: [emailAddress], mailBody: "Here is mail body") {
                showingMail = false
            }
        }
    }
}
