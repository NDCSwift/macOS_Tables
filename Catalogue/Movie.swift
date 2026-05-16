//
        //
    //  Project: Catalogue
    //  File: Movie.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    
import Foundation

// Core data model representing a single movie entry in the catalogue.
// Conforms to Identifiable so SwiftUI Table can track rows by stable UUID.
struct Movie: Identifiable {
    let id: UUID

    var title: String
    var year: Int
    var director: String
    var genre: Genre
    // Out-of-10 rating used to drive the colour-coded RatingBadge.
    var rating: Double
    var watched: Bool

    // Comparable conformance lets the Table sort the Genre column alphabetically
    // using its raw string value without a custom sort descriptor.
    enum Genre: String, CaseIterable, Comparable {
        case action   = "Action"
        case comedy   = "Comedy"
        case drama    = "Drama"
        case scifi    = "Sci-Fi"
        case thriller = "Thriller"

        static func <(lhs: Genre, rhs: Genre) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
}

extension Movie {
    // Hard-coded sample data used to populate the table during development and previews.
    static let samples: [Movie] = [
        Movie(id: .init(), title: "The Godfather",          year: 1972, director: "Francis Ford Coppola", genre: .drama,    rating: 9.2, watched: true),
        Movie(id: .init(), title: "Blade Runner",           year: 1982, director: "Ridley Scott",         genre: .scifi,    rating: 8.1, watched: false),
        Movie(id: .init(), title: "Pulp Fiction",           year: 1994, director: "Quentin Tarantino",   genre: .thriller, rating: 8.9, watched: true),
        Movie(id: .init(), title: "The Matrix",             year: 1999, director: "Lana Wachowski",       genre: .scifi,    rating: 8.7, watched: true),
        Movie(id: .init(), title: "No Country for Old Men", year: 2007, director: "Coen Brothers",        genre: .thriller, rating: 8.2, watched: false),
        Movie(id: .init(), title: "Inception",              year: 2010, director: "Christopher Nolan",    genre: .scifi,    rating: 8.8, watched: true),
        Movie(id: .init(), title: "Whiplash",               year: 2014, director: "Damien Chazelle",      genre: .drama,    rating: 8.5, watched: false),
        Movie(id: .init(), title: "Parasite",               year: 2019, director: "Bong Joon-ho",         genre: .thriller, rating: 8.5, watched: true),
        Movie(id: .init(), title: "Everything Everywhere All at Once", year: 2022, director: "Daniel Kwan & Daniel Scheinert", genre: .scifi, rating: 8.0, watched: false),
        Movie(id: .init(), title: "Dune: Part Two",         year: 2024, director: "Denis Villeneuve",     genre: .scifi,    rating: 8.6, watched: true),
    ]
}

