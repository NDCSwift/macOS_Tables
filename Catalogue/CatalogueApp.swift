//
        //
    //  Project: Catalogue
    //  File: CatalogueApp.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// App entry point — SwiftUI lifecycle, no AppDelegate needed.
@main
struct CatalogueApp: App {
    var body: some Scene {
        // Single window group containing the main catalogue table.
        WindowGroup {
            CatalogueView()
        }
    }
}
