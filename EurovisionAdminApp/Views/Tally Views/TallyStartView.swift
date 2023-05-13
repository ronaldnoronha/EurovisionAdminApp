//
//  TallyStartView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 10/5/2023.
//

import SwiftUI

struct TallyStartView: View {
    @ObservedObject var manager: EurovisionServiceManager
    @State var shouldTransit = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Are you sure you want to start Tally, this blocks any more votes from being registered?")
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: TallyManagerView(votes: manager.votes?.shuffled() ?? []), isActive: $shouldTransit) {
                    Text("Tally Votes")
                        .onTapGesture {
                            Task {
                                try await manager.tally()
                                try await manager.retrieveVotes()
                                shouldTransit = true
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct TallyStartView_Previews: PreviewProvider {
    static let manager: EurovisionServiceManager = EurovisionServiceManager()
    static var previews: some View {
        TallyStartView(manager: manager)
    }
}
