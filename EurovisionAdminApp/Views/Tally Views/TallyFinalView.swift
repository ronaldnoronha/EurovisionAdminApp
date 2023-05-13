//
//  TallyFinalView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2023.
//

import SwiftUI

struct TallyFinalView: View {
    var scoreboard: Scoreboard
    var body: some View {
        let keys = scoreboard.scores.sorted { $0.1 > $1.1 }.map { $0.0 }
        
        NavigationStack {
            Section {
                VStack {
                    Text("WINNER")
                        .font(.title)
                    HStack {
                        Text("\(keys[0].capitalized)")
                            .font(.title)
                        Spacer()
                        Text("\(scoreboard.scores[keys[0]]!) points")
                            .font(.title)
                    }
                }
            }
            .padding()
            
            Section {
                List {
                    ForEach(keys[1...], id:\.self) { key in
                        HStack {
                            Text("\(key.capitalized)")
                            Spacer()
                            Text("\(scoreboard.scores[key]!) points")
                        }
                    }
                }
            }
        }
        .navigationTitle("Final Scoreboard")
    }
}

struct TallyFinalView_Previews: PreviewProvider {
    static let scoreboard = Scoreboard()
    static var previews: some View {
        scoreboard.addVotes(vote: votes[4])
        return TallyFinalView(scoreboard: scoreboard)
    }
}
