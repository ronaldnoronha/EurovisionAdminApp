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
            List {
                VoteDetailCellView(points: 12, country: vote.points12)
                VoteDetailCellView(points: 10, country: vote.points10)
                VoteDetailCellView(points: 8, country: vote.points8)
                VoteDetailCellView(points: 7, country: vote.points7)
                VoteDetailCellView(points: 6, country: vote.points6)
                VoteDetailCellView(points: 5, country: vote.points5)
                VoteDetailCellView(points: 4, country: vote.points4)
                VoteDetailCellView(points: 3, country: vote.points3)
                VoteDetailCellView(points: 2, country: vote.points2)
                VoteDetailCellView(points: 1, country: vote.points1)
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
