//
        //
    //  Project: Catalogue
    //  File: RatingBadge.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// A small pill-shaped badge that displays a movie's rating with a colour that
// reflects its quality tier: green (≥8), orange (≥6), red (<6).
struct RatingBadge: View {
    let rating: Double

    var body: some View {
        Text(String(format: "%.1f", rating))
            .font(.caption)
            .fontWeight(.semibold)
            .monospacedDigit()         // keeps badge width stable as numbers change
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(color.opacity(0.15), in: Capsule())
            .foregroundStyle(color)
    }

    // Derived once per render; no stored state needed.
    private var color: Color {
        rating >= 8 ? .green : rating >= 6 ? .orange : .red
    }
}

#Preview {
    RatingBadge(rating: 9)
}
