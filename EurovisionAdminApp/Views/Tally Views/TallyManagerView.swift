//
//  TallyManagerView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 10/5/2023.
//

import SwiftUI


enum TallyStates {
    case country
    case listOf9
    case points12
    case scoreboard
    case winnerDetermined
    case finalTally
}

struct TallyManagerView: View {
    var votes: [Vote]
    @State var indexOfCountry: Int = 0
    @State var presentationState: TallyStates = TallyStates.country
    @State var scoreboard: Scoreboard = Scoreboard()
    
    
    var body: some View {
        NavigationStack {
            VStack {
                switch presentationState {
                case .country:
                    TallyCountryView(country: votes[indexOfCountry].country, presentationState: $presentationState)
                case .listOf9:
                    TallyListOf9View(vote: votes[indexOfCountry], presentationState: $presentationState)
                case .points12:
                    TallyPoints12View(vote: votes[indexOfCountry], presentationState: $presentationState)
                        .onAppear {
                            scoreboard.addVotes(vote: votes[indexOfCountry])
                        }
                case .scoreboard:
                    TallyScoreboardView(scoreboard: $scoreboard, presentationState: $presentationState, indexOfCountry: $indexOfCountry)
                case .winnerDetermined:
                    TallyWinnerDeterminedView()
                case .finalTally:
                    TallyFinalView()
                }
            }
        }
        .navigationTitle("Tally")
    }
}

struct TallyManagerView_Previews: PreviewProvider {
    static let votes = getVotes().shuffled()
    static var previews: some View {
        TallyManagerView(votes: votes)
    }
}
