//
//  ContactModel.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//


import Foundation

struct ContactModel: Identifiable {

    let id: String
    let firstName: String
    let lastName: String
    let phone: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}