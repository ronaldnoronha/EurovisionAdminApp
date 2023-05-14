//
//  ContentView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 8/5/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var manager = EurovisionServiceManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("eurovision").resizable()
                    .resizable()
                    .frame(maxWidth: 900, maxHeight: 900)
                    .opacity(0.25)
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: VotesSummaryView(manager: manager)) {
                        Text("Votes")
                            .font(.title2)
                            .bold()
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: TallyStartView(manager: manager)) {
                        Text("Tally")
                            .font(.title2)
                            .bold()
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                }
                .opacity(0.85)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
