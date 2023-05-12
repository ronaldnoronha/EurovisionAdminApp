//
//  TallyStartView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 10/5/2023.
//

import SwiftUI

struct TallyStartView: View {
    @ObservedObject var manager: EurovisionServiceManager
    var body: some View {
        NavigationStack {
            VStack {
                Text("Are you sure you want to start Tally, this blocks any more votes from being registered?")
                
                NavigationLink {
                    TallyManagerView(votes: manager.votes!.shuffled())
                } label: {
                    Button {
                        Task {
                            try await manager.tally()
                        }
                    } label: {
                        Text("Tally Votes")
                    }
                    .cornerRadius(20)

                }

            }
            
            
        }
    }
}

struct TallyStartView_Previews: PreviewProvider {
    static let manager: EurovisionServiceManager = EurovisionServiceManager()
    static var previews: some View {
        TallyStartView(manager: manager)
    }
}
