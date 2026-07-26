//
//  ContactManager.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//


import Contacts

final class ContactManager {

    static let shared = ContactManager()

    private let store = CNContactStore()

    private init() {}
    
    func saveContact(
        firstName: String,
        lastName: String,
        phone: String
    ) throws {

        let contact = CNMutableContact()

        contact.givenName = firstName
        contact.familyName = lastName

        contact.phoneNumbers = [

            CNLabeledValue(
                label: CNLabelPhoneNumberMobile,
                value: CNPhoneNumber(stringValue: phone)
            )

        ]

        let request = CNSaveRequest()

        request.add(contact, toContainerWithIdentifier: nil)

        try store.execute(request)

    }
    
    func fetchContacts() async throws -> [ContactModel] {

            try await Task.detached(priority: .userInitiated) { [store] in

                var contacts: [ContactModel] = []

                let keys: [CNKeyDescriptor] = [
                    CNContactIdentifierKey as CNKeyDescriptor,
                    CNContactGivenNameKey as CNKeyDescriptor,
                    CNContactFamilyNameKey as CNKeyDescriptor,
                    CNContactPhoneNumbersKey as CNKeyDescriptor
                ]

                let request = CNContactFetchRequest(keysToFetch: keys)

                try store.enumerateContacts(with: request) { contact, _ in

                    contacts.append(
                        ContactModel(
                            id: contact.identifier,
                            firstName: contact.givenName,
                            lastName: contact.familyName,
                            phone: contact.phoneNumbers.first?.value.stringValue ?? ""
                        )
                    )

                }

                return contacts.sorted {
                    $0.fullName.localizedCaseInsensitiveCompare($1.fullName) == .orderedAscending
                }

            }.value

        }
    
    func deleteContact(
        identifier: String
    ) throws {

        let keys = [CNContactIdentifierKey as CNKeyDescriptor]

        let predicate = CNContact.predicateForContacts(withIdentifiers: [identifier])

        let contact = try store.unifiedContacts(
            matching: predicate,
            keysToFetch: keys
        ).first

        guard let mutable = contact?.mutableCopy() as? CNMutableContact else {

            return

        }

        let request = CNSaveRequest()

        request.delete(mutable)

        try store.execute(request)

    }

}
