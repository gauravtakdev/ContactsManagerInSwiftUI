//
//  ContactRow.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//


import SwiftUI

struct ContactRow: View {

    let contact: ContactModel

    var body: some View {

        HStack {

            Circle()

                .fill(.blue)

                .frame(width: 45,height:45)

                .overlay {

                    Text(contact.firstName.prefix(1))

                        .foregroundStyle(.white)

                }

            VStack(alignment:.leading){

                Text(contact.fullName)

                Text(contact.phone)

                    .foregroundStyle(.secondary)

            }

        }

    }

}