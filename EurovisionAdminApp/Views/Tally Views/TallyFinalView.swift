//
//  TallyFinalView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2023.
//

import SwiftUI

struct TallyFinalView: View {
    var scoreboard: Scoreboard
    var body: some View {
        let keys = scoreboard.scores.sorted { $0.1 > $1.1 }.map { $0.0 }
        
        NavigationStack {
            ZStack {
                Image("eurovision").resizable()
                    .resizable()
                    .frame(maxWidth: 900, maxHeight: 900)
                    .opacity(0.25)
                
                VStack {
                    Section {
                        VStack {
                            
                            HStack {
                                Image(keys[0])
                                    .resizable()
                                    .frame(maxWidth: 75, maxHeight: 75)
                                Text("\(keys[0].capitalized)")
                                    .font(.title)
                                Spacer()
                                Text("WINNER")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.blue.gradient)
                                Spacer()
                                Text("\(scoreboard.scores[keys[0]]!) points")
                                    .font(.title)
                            }
                        }
                    }
                    .padding()
                    
                    Section {
                        List {
                            ForEach(keys[1...], id:\.self) { key in
                                HStack {
                                    Image(key)
                                        .resizable()
                                        .frame(maxWidth: 50, maxHeight: 50)
                                    Text("\(key.capitalized)")
                                    Spacer()
                                    Text("\(scoreboard.scores[key]!) points")
                                }
                            }
                        }
                    }
                }
                .opacity(0.85)
            }
        }
        .navigationTitle("Final Scoreboard")
    }
}

struct TallyFinalView_Previews: PreviewProvider {
    static let scoreboard = Scoreboard()
    static var previews: some View {
        scoreboard.addVotes(vote: votes[4])
        return TallyFinalView(scoreboard: scoreboard)
    }
}
