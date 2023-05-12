//
//  Constants.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2023.
//

import Foundation

func getVotes() -> [Vote] {
    guard let fileUrl = Bundle.main.url(forResource: "Votes", withExtension: "json") else  {
        fatalError("Couldn't find file in app bundle")
    }

    do {
        let jsonData = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        var response = try decoder.decode(VotesResponse.self, from: jsonData)
        return response.votes
    } catch {
        fatalError("Couldn't decode object from JSON: \(error)")
    }
}

let votes = getVotes().shuffled()

let participants: [String] = [
    "albania",
    "armenia",
    "australia",
    "austria",
    "azerbaijan",
    "belgium",
    "bulgaria",
    "croatia",
    "cyprus",
    "czech-republic",
    "denmark",
    "estonia",
    "finland",
    "france",
    "germany",
    "georgia",
    "greece",
    "iceland",
    "ireland",
    "israel",
    "italy",
    "latvia",
    "lithuania",
    "malta",
    "moldova",
    "montenegro",
    "netherlands",
    "north-macedonia",
    "norway",
    "poland",
    "portugal",
    "romania",
    "san-marino",
    "serbia",
    "slovenia",
    "spain",
    "sweden",
    "switzerland",
    "ukraine",
    "united-kingdom"
]


