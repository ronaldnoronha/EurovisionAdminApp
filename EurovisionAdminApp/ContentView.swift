//
//  ContentView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 8/5/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var manager = EurovisionServiceManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: VotesSummaryView(manager: manager)) {
                    Text("Votes")
                        .font(.title2)
                        .bold()
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
