//
//  TallyStartView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 10/5/2023.
//

import SwiftUI

struct TallyStartView: View {
    @ObservedObject var manager: EurovisionServiceManager
    @State var shouldTransit = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("eurovision").resizable()
                    .resizable()
                    .frame(maxWidth: 900, maxHeight: 900)
                    .opacity(0.25)
                
                VStack {
                    Spacer()
                    
                    Text("Are you sure you want to close the voting lines? This blocks any more votes from being registered")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: TallyManagerView(votes: manager.votes?.shuffled() ?? []), isActive: $shouldTransit) {
                        Text("Close Voting")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .bold()
                            .onTapGesture {
                                Task {
                                    try await manager.tally()
                                    try await manager.retrieveVotes()
                                    shouldTransit = true
                            }
                        }
                    }
                    .frame(height: 50)
                    .background(LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(20)
                }
                .padding()
                .opacity(0.85)
            }
        }
    }
}

struct TallyStartView_Previews: PreviewProvider {
    static let manager: EurovisionServiceManager = EurovisionServiceManager()
    static var previews: some View {
        TallyStartView(manager: manager)
    }
}
