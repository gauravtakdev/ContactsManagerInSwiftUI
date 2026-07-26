//
//  ContactsViewModel.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//


import SwiftUI
import Combine

@MainActor
final class ContactsViewModel: ObservableObject {

    @Published var contacts: [ContactModel] = []
    
    @Published var searchText = ""

    var filteredContacts: [ContactModel] {

        if searchText.isEmpty {

            return contacts

        }

        return contacts.filter {

            $0.fullName.localizedCaseInsensitiveContains(searchText)

        }

    }

    func loadContacts() {

        do {

            contacts = try ContactManager.shared.fetchContacts()

        }

        catch {

            print(error)

        }

    }
    
    func deleteContact(at offsets: IndexSet) {

        guard let index = offsets.first else { return }

        let contact = filteredContacts[index]

        do {
            try ContactManager.shared.deleteContact(identifier: contact.id)
            loadContacts()
        } catch {
            print("Failed to delete contact: \(error.localizedDescription)")
        }
    }

}
