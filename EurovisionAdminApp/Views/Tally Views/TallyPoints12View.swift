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
    var isFinalVote: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                Image("eurovision").resizable()
                    .resizable()
                    .frame(maxWidth: 900, maxHeight: 900)
                    .opacity(0.25)
                
                VStack {
                    Image(vote.points12)
                        .resizable()
                        .frame(maxWidth: 150, maxHeight: 150)
                    Text(vote.points12.capitalized)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                .opacity(0.85)
            }
        }
        .navigationTitle("\(vote.country.capitalized) douze points go to")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isFinalVote ? "Final Scoreboard" : "Scoreboard") {
                    presentationState = isFinalVote ? TallyStates.finalTally : TallyStates.scoreboard
                }
            }
        }
    }
}

struct TallyPoints12View_Previews: PreviewProvider {
    @State static var presentationState: TallyStates = TallyStates.points12
    static var previews: some View {
        TallyPoints12View(vote: votes[0], presentationState: $presentationState, isFinalVote: false)
    }
}
