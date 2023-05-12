//
//  TallyScoreboardView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2023.
//

import SwiftUI

struct TallyScoreboardView: View {
    @Binding var scoreboard: Scoreboard
    @Binding var presentationState: TallyStates
    @Binding var indexOfCountry: Int
    
    var body: some View {
        let keys = scoreboard.scores.sorted { $0.1 > $1.1 }.map { $0.0 }
        
        NavigationStack {
            List {
                ForEach(keys, id:\.self) { key in
                    HStack {
                        Text("\(key.capitalized)")
                        Spacer()
                        Text("\(scoreboard.scores[key]!) points")
                    }
                }
            }
        }
        .navigationTitle("Scoreboard")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Next") {
                    indexOfCountry += 1
                    presentationState = TallyStates.country
                }
            }
        }
    }
}

struct TallyScoreboardView_Previews: PreviewProvider {
    @State static var scoreboard: Scoreboard = Scoreboard()
    @State static var presentationState: TallyStates = TallyStates.scoreboard
    @State static var indexOfCountry: Int = 0
    static var previews: some View {
        TallyScoreboardView(scoreboard: $scoreboard, presentationState: $presentationState, indexOfCountry: $indexOfCountry)
    }
}
