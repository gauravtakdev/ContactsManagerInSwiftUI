//
//  PermissionManager.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//


import Contacts
import Combine
import SwiftUI

@MainActor
final class PermissionManager: ObservableObject {

    @Published var authorizationStatus: CNAuthorizationStatus = .notDetermined

    init() {
        authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
    }

    /// Requests Contacts permission
    func requestPermission() async -> Bool {

        let store = CNContactStore()

        do {
            let granted = try await store.requestAccess(for: .contacts)

            authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)

            return granted

        } catch {

            authorizationStatus = .denied
            return false

        }
    }

    /// Refresh current permission status
    func refreshStatus() {

        authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)

    }

    /// Whether the app currently has access
    var hasPermission: Bool {

        authorizationStatus == .authorized ||
        authorizationStatus == .limited

    }

    /// True if user has denied permission
    var isDenied: Bool {

        authorizationStatus == .denied

    }

    /// Open the app's Settings page
    func openSettings() {

        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }

    }

}
