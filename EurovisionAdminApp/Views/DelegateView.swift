//
//  DelegateView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2024.
//

import SwiftUI

struct DelegateView: View {
    @ObservedObject var manager: EurovisionServiceManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("eurovision")
                    .resizable()
                    .frame(maxWidth: 900, maxHeight: 900)
                    .opacity(0.25)
                
                VStack {
                    if let delegates = manager.delegates {
                        ForEach(delegates) { delegate in
                            HStack {
                                Spacer()
                                Text(delegate.delegate)
                                    .bold()
                                Spacer()
                                Image(delegate.country)
                                    .resizable()
                                    .frame(maxWidth: 50, maxHeight: 50)
                                Text(delegate.country.capitalized)
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                try await manager.retrieveDelegates()
            }
        }
    }
}

struct DelegateView_Previews: PreviewProvider {
    static var manager: EurovisionServiceManager = EurovisionServiceManager()
    static var previews: some View {
        DelegateView(manager: manager)
    }
}
