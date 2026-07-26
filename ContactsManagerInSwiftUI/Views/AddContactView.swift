//
//  AddContactView.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//

import SwiftUI

struct AddContactView: View {

    @State private var firstName = ""

    @State private var lastName = ""

    @State private var phone = ""

    @Environment(\.dismiss)
    var dismiss

    var body: some View {

        Form {

            TextField("First Name", text: $firstName)

            TextField("Last Name", text: $lastName)

            TextField("Phone", text: $phone)

            Button("Save") {

                try? ContactManager.shared.saveContact(
                    firstName: firstName,
                    lastName: lastName,
                    phone: phone
                )

                dismiss()

            }

        }

    }

}
