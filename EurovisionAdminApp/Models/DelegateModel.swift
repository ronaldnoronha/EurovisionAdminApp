//
//  DelegateModel.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2024.
//

import Foundation

struct Delegate: Codable, Identifiable {
    let id: String
    let delegate: String
    let country: String
}
