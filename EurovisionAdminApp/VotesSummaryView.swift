//
//  VotesSummaryView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 8/5/2023.
//

import SwiftUI

struct VotesSummaryView: View {
    @ObservedObject var manager: EurovisionServiceManager
    
    var body: some View {
        NavigationStack {
            List {
                if let votes = manager.votes {
                    ForEach(votes) { vote in
                        Text(vote.delegate)
                    }
                }                    
            }
        }
        .onAppear {
            Task {
                try await manager.retrieveVotes()
            }
        }
    }
}

struct VotesSummaryView_Previews: PreviewProvider {
    static var manager: EurovisionServiceManager = EurovisionServiceManager()
    static var previews: some View {
        VotesSummaryView(manager: manager)
    }
}
