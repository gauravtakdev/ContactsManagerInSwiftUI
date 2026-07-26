//
//  ContentView.swift
//  ContactsManagerInSwiftUI
//
//  Created by Gaurav Tak on 26/07/26.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Text("Contacts Manager")
                    .font(.largeTitle)

                NavigationLink("Open Contacts") {
                    HomeView()
                }

            }
            .navigationTitle("Home")

        }

    }
}
