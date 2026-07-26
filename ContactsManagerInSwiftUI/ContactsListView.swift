//
//  ContactsListView.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//
import SwiftUI

struct ContactsListView: View {

    @StateObject
    private var vm = ContactsViewModel()
    
    @StateObject
    private var permissionManager = PermissionManager()
   

    @State
    private var showAddContact = false

    var body: some View {

        List {

            ForEach(vm.filteredContacts) { contact in
                ContactRow(contact: contact)
            }
            .onDelete(perform: vm.deleteContact)

        }
        .searchable(text: $vm.searchText)
        .navigationTitle("Contacts")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {

            ToolbarItem(placement: .topBarTrailing) {

                Button {
                    showAddContact = true
                } label: {
                    Image(systemName: "plus")
                }

            }

        }.task {
            
            if permissionManager.hasPermission {

                vm.loadContacts()

            } else {

                let granted = await permissionManager.requestPermission()

                if granted {
                    vm.loadContacts()
                }

            }

        }
        .sheet(isPresented: $showAddContact, onDismiss: {
            vm.loadContacts()
        }) {
            AddContactView()
        }.overlay {
            
            if permissionManager.isDenied {

                ContentUnavailableView {

                    Label("Contacts Permission Required",
                          systemImage: "person.crop.circle.badge.exclamationmark")

                } description: {

                    Text("Please allow Contacts access from Settings to manage your contacts.")

                } actions: {

                    Button("Open Settings") {
                        permissionManager.openSettings()
                    }

                }

            }

        }

    }
}

#Preview {
    NavigationStack {
        ContactsListView()
    }
}
