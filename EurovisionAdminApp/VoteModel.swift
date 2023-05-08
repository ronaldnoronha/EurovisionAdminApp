//
//  VoteModel.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 8/5/2023.
//

import Foundation

struct Vote: Codable, Identifiable {
    let id: String
    let delegate: String
    let country: String
    let points12: String
    let points10: String
    let points8: String
    let points7: String
    let points6: String
    let points5: String
    let points4: String
    let points3: String
    let points2: String
    let points1: String
}
