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
            List {
                HStack {
                    Text("Points 10:")
                    Spacer()
                    Text("\(vote.points10.capitalized)")
                }
                HStack {
                    Text("Points 8:")
                    Spacer()
                    Text("\(vote.points8.capitalized)")
                }
                HStack {
                    Text("Points 7:")
                    Spacer()
                    Text("\(vote.points7.capitalized)")
                }
                HStack {
                    Text("Points 6:")
                    Spacer()
                    Text("\(vote.points6.capitalized)")
                }
                HStack {
                    Text("Points 5:")
                    Spacer()
                    Text("\(vote.points5.capitalized)")
                }
                HStack {
                    Text("Points 4:")
                    Spacer()
                    Text("\(vote.points4.capitalized)")
                }
                HStack {
                    Text("Points 3:")
                    Spacer()
                    Text("\(vote.points3.capitalized)")
                }
                HStack {
                    Text("Points 2:")
                    Spacer()
                    Text("\(vote.points2.capitalized)")
                }
                HStack {
                    Text("Points 1:")
                    Spacer()
                    Text("\(vote.points1.capitalized)")
                }
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
