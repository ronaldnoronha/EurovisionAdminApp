//
//  TallyListOf9View.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2023.
//

import SwiftUI

struct TallyListOf9View: View {
    var vote: Vote
    @Binding var presentationState: TallyStates
    var body: some View {
        NavigationStack {
            ZStack {
                Image("eurovision").resizable()
                    .resizable()
                    .frame(maxWidth: 900, maxHeight: 900)
                    .opacity(0.25)
                
                List {
                    TallyListOf9CellView(points: 10, country: vote.points10)
                    TallyListOf9CellView(points: 8, country: vote.points8)
                    TallyListOf9CellView(points: 7, country: vote.points7)
                    TallyListOf9CellView(points: 6, country: vote.points6)
                    TallyListOf9CellView(points: 5, country: vote.points5)
                    TallyListOf9CellView(points: 4, country: vote.points4)
                    TallyListOf9CellView(points: 3, country: vote.points3)
                    TallyListOf9CellView(points: 2, country: vote.points2)
                    TallyListOf9CellView(points: 1, country: vote.points1)
                }
                .opacity(0.85)
            }
        }
        .navigationTitle("\(vote.country.capitalized) votes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("12 points") {
                    presentationState = TallyStates.points12
                }
            }
        }
    }
}

struct TallyListOf9View_Previews: PreviewProvider {
    @State static var presentationState: TallyStates = TallyStates.listOf9
    static var previews: some View {
        TallyListOf9View(vote: votes[0], presentationState: $presentationState)
    }
}
