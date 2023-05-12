//
//  VoteDetailView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 9/5/2023.
//

import SwiftUI

struct VoteDetailView: View {
    let vote: Vote
    var body: some View {
        NavigationStack {
            VStack {
                Text("12 points: \(vote.points12.capitalized)")
                Text("10 points: \(vote.points10.capitalized)")
                Text("8 points: \(vote.points8.capitalized)")
                Text("7 points: \(vote.points7.capitalized)")
                Text("6 points: \(vote.points6.capitalized)")
                Text("5 points: \(vote.points5.capitalized)")
                Text("4 points: \(vote.points4.capitalized)")
                Text("3 points: \(vote.points3.capitalized)")
                Text("2 points: \(vote.points2.capitalized)")
                Text("1 point: \(vote.points1.capitalized)")
            }
        }
        .navigationTitle(vote.delegate.capitalized)
    }
}

struct VoteDetailView_Previews: PreviewProvider {
    static let vote = Vote(
        id: "",
        delegate: "test",
        country: "australia",
        points12: "azerbaijan",
        points10: "armenia",
        points8: "united-kingdom",
        points7: "austria",
        points6: "netherlands",
        points5: "belgium",
        points4: "spain",
        points3: "sweden",
        points2: "italy",
        points1: "france"
    )
    static var previews: some View {
        VoteDetailView(vote: vote)
    }
}
