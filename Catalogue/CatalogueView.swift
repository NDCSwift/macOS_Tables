//
        //
    //  Project: Catalogue
    //  File: CatalogueView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// Main screen of the app — a multi-column, sortable, selectable Table of movies.
// Selection supports both single and multi-row operations via the context menu.
struct CatalogueView: View {
    // In-memory movie list; would be replaced by a SwiftData query in production.
    @State private var movies = Movie.samples
    // Drives Table's built-in sort; starts sorted by title ascending.
    @State private var sortOrder = [KeyPathComparator(\Movie.title)]
    // Tracks which rows are currently selected (supports multi-selection on macOS/iPad).
    @State private var selection = Set<Movie.ID>()

    // Persists the user's column visibility/order choices across launches via SceneStorage.
    @SceneStorage("catalogueColumnCustomization") private var columnCustumoization: TableColumnCustomization<Movie>

    var body: some View {
        Table(movies, selection: $selection, sortOrder: $sortOrder, columnCustomization: $columnCustumoization) {

            // Title column — wider range to accommodate long film names.
            TableColumn("Title", value: \.title)
                .width(min: 150, ideal: 250, max: 400)
                .customizationID("title")

            // Year rendered with monospaced digits so numbers stay visually aligned.
            TableColumn("Year", value: \.year) { movie in
                Text(String(movie.year))
                    .monospacedDigit()
                    .bold()
            }
            .width(60)
            .customizationID("year")

            TableColumn("Director", value: \.director)
                .width(min: 120, max: 280)

            // Genre uses rawValue display; sortable via Genre's Comparable conformance.
            TableColumn("Genre", value: \.genre) { movie in
                Text(movie.genre.rawValue)
            }
            .width(90)
            .customizationID("director")

            // Rating column uses a custom badge view instead of plain text.
            TableColumn("Rating") { movie in
                RatingBadge(rating: movie.rating)
            }
            .width(70)
            .customizationID("rating")
        }
        .tableStyle(.bordered)
        .alternatingRowBackgrounds()

        // Re-sort the array whenever the user clicks a column header.
        .onChange(of: sortOrder) { _, newOrder in
            movies.sort(using: newOrder)
        }
        .toolbar {
            ToolbarItem {
                // Toolbar delete button mirrors the context menu action for keyboard-first users.
                Button("Delete", role: .destructive) {
                    movies.removeAll { selection.contains($0.id) }
                    selection.removeAll()
                }
                .disabled(selection.isEmpty)
            }
        }
        // Context menu adapts its options based on how many rows are selected.
        .contextMenu(forSelectionType: Movie.ID.self) { items in
            if items.isEmpty {
                // Right-clicking on empty space offers an add action (sheet not yet implemented).
                Button("Add Movie") {
                    // open new movie sheet
                }
            } else if items.count == 1 {
                Button("mark as watched") {
                    toggleWatched(ids: items)
                }
                Divider()
                Button("Delete", role: .destructive) {
                    delete(ids: items)
                }
            } else {
                // Bulk actions when multiple rows are selected.
                Button("Mark \(items.count) As Watched") {
                    toggleWatched(ids: items)
                }
                Divider()
                Button("Delete \(items.count) Movies", role: .destructive) {
                    delete(ids: items)
                }
            }
        } primaryAction: { items in
            // Double-click / Return key — placeholder for a future detail view.
            guard let id = items.first else { return }
            print("Open detail for \(id)")
        }
    }

    // Flips the watched flag for every movie whose ID appears in the provided set.
    private func toggleWatched(ids: Set<Movie.ID>) {
        for index in movies.indices where ids.contains(movies[index].id) {
            movies[index].watched.toggle()
        }
    }

    // Removes movies by ID and clears them from the selection set to avoid stale references.
    private func delete(ids: Set<Movie.ID>) {
        movies.removeAll { ids.contains($0.id) }
        selection.subtract(ids)
    }
}


#Preview {
    CatalogueView()
}
