//
//  TallyPoints12View.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2023.
//

import SwiftUI

struct TallyPoints12View: View {
    var vote: Vote
    @Binding var presentationState: TallyStates
    var body: some View {
        NavigationStack {
            Text(vote.points12.capitalized)
        }
        .navigationTitle("\(vote.country.capitalized) douze points go to")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Scoreboard") {
                    presentationState = TallyStates.scoreboard
                }
            }
        }
    }
}

struct TallyPoints12View_Previews: PreviewProvider {
    @State static var presentationState: TallyStates = TallyStates.points12
    static var previews: some View {
        TallyPoints12View(vote: votes[0], presentationState: $presentationState)
    }
}
