//
//  VoteDetailCellView.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 13/5/2023.
//

import SwiftUI

struct VoteDetailCellView: View {
    var points: Int
    var country: String
    var body: some View {
        HStack {
            Text("\(points) points: ")
                .font(.title3)
            Spacer()
            Text("\(country.capitalized)")
                .font(.title3)
            Image(country)
                .resizable()
                .frame(maxWidth: 50, maxHeight: 50)
        }
        .padding()
    }
}

struct VoteDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        VoteDetailCellView(points: 12, country: "australia")
    }
}
