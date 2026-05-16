//
//  Project: Catalogue
//  File: MovieListView.swift
//  Created by Noah Carpenter
//
//  📺 YouTube: Noah Does Coding
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Dream Big. Code Bigger 🚀
//

import SwiftUI

// A deliberately naive movie list built with List + HStack.
// This view exists purely as a contrast to CatalogueView (Table) to show
// what you give up when you reach for List instead of Table for tabular data:
//
//   ❌ No column headers — readers have to guess what each value means
//   ❌ No tap-to-sort — every sort field needs its own manual button
//   ❌ No multi-select — List only supports single-row selection
//   ❌ No column alignment — HStack widths fight each other row by row
//   ❌ Text truncates unpredictably — no fixed column width contract
struct MovieListView: View {

    @State private var movies = Movie.samples

    // Only one sort axis exposed — adding year, director, etc. means adding
    // more buttons manually. Table gets all of this for free per column.
    @State private var titleAscending = true

    var body: some View {
        // No header row. A reader seeing this for the first time has no idea
        // which value is the year, which is the rating, or what order things are in.
        List {
            ForEach(movies) { movie in
                // Each row is a plain HStack — no column system backing it.
                // Watch how alignment drifts: a short title like "Dune: Part Two" and a long
                // one like "Everything Everywhere All at Once" push every trailing field to a
                // different x position. Table columns guarantee alignment for free.
                HStack(spacing: 8) {

                    // VStack handles overflow for long titles/directors, but this breaks
                    // row height uniformity — rows are no longer the same size.
                    VStack(alignment: .leading, spacing: 2) {
                        Text(movie.title)
                            .fontWeight(.semibold)
                            .lineLimit(1) // long titles are silently cut off with no recourse
                        Text(movie.director)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(1) // "Daniel Kwan & Daniel Scheinert" just disappears
                    }

                    Spacer()

                    // Year, genre, and rating crammed into the trailing edge with no
                    // fixed widths. Space available depends on how wide the title was.
                    Text(String(movie.year))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .monospacedDigit()

                    Text(movie.genre.rawValue)
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    // Plain rating number — no colour coding, no badge, just text.
                    // Compare to RatingBadge in the Table version.
                    Text(String(format: "%.1f", movie.rating))
                        .font(.caption)
                        .monospacedDigit()
                }
            }
        }
        // The only sortable field. To add sort-by-year you'd write another button;
        // sort-by-director, yet another. Table columns handle this natively.
        .toolbar {
            ToolbarItem {
                Button(titleAscending ? "Title ↑" : "Title ↓") {
                    titleAscending.toggle()
                    movies.sort {
                        titleAscending ? $0.title < $1.title : $0.title > $1.title
                    }
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
