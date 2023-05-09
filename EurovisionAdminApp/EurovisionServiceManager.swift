//
//  EurovisionServiceManager.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 8/5/2023.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}

struct VotesResponse: Codable {
    let votes: [Vote]
}

class EurovisionServiceManager: ObservableObject {
    @Published var votes: [Vote]?
    
    enum Constants {
        static let api = "https://eurovision.loca.lt"
        static let votes = "/votes"
        static let delete = "/delete"
    }
    
    func retrieveVotes() async throws {
        var url = URLComponents(string: Constants.api)
        url?.path = Constants.votes
        
        guard let url = url?.url else {
            throw RequestError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(VotesResponse.self, from: data)
        votes = response.votes
    }
    
    func delete(delegate: String) async throws {
        var url = URLComponents(string: Constants.api)
        url?.path = Constants.delete
        let queryItems = [
            URLQueryItem(name: "delegate", value: delegate)
        ]
        url?.queryItems = queryItems
        guard let url = url?.url else {
            throw RequestError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(VotesResponse.self, from: data)
        votes = response.votes
    }
    
    func tally() {}
}
