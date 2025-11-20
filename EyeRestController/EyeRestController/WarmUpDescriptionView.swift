//
//  WarmUpDescriptionView.swift
//  EyeRestController
//
//  Created by Артём on 19.11.2025.
//

import SwiftUI

struct WarmUpDescriptionView: View {
    var warmupId: Int
    
    var body: some View {
        ZStack {
            Color(.pink.opacity(0.2))
            VStack() {
                Text("\(warmups[warmupId - 1].description)")
                    .padding()
                    .background(Color.pink.opacity(0.6), in: RoundedRectangle(cornerRadius: 12))
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title)
                    .navigationTitle(warmups[warmupId - 1].title)
                

            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WarmUpDescriptionView(warmupId: 1)
}
