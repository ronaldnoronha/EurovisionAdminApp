//
//  TallyListOf9CellView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 13/5/2023.
//

import SwiftUI

struct TallyListOf9CellView: View {
    let points: Int
    let country: String
    var body: some View {
        HStack {
            Text("Points \(points):")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Spacer()
            Image(country)
                .resizable()
                .frame(maxWidth: 50, maxHeight: 50)
            Text("\(country.capitalized)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
        }
    }
}

struct TallyListOf9CellView_Previews: PreviewProvider {
    static var previews: some View {
        TallyListOf9CellView(points: 12, country: "australia")
    }
}
