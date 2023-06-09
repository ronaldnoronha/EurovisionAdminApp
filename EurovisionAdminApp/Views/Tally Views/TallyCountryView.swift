//
//  TallyCountryView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 11/5/2023.
//

import SwiftUI

struct TallyCountryView: View {
    var country: String
    @Binding var presentationState: TallyStates
    var body: some View {
        NavigationStack {
            ZStack {
                Image("eurovision").resizable()
                    .resizable()
                    .frame(maxWidth: 900, maxHeight: 900)
                    .opacity(0.25)
                
                VStack {
                    Image(country)
                        .resizable()
                        .frame(maxWidth: 150, maxHeight: 150)
                    Text(country.capitalized)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                .opacity(0.85)
            }
            
        }
        .navigationTitle("Eurovision calling...")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Next") {
                    presentationState = TallyStates.listOf9
                }
            }
        }
    }
}

struct TallyCountryView_Previews: PreviewProvider {
    @State static var presentationState: TallyStates = TallyStates.country
    static var previews: some View {
        TallyCountryView(country: "australia", presentationState: $presentationState)
    }
}
