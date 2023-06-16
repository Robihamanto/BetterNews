//
//  BetterNewsApp.swift
//  BetterNews
//
//  Created by Robihamanto, Robihamanto | MCPD on 6/16/23.
//

import SwiftUI

@main
struct BetterNewsApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = FeedViewModel(newsService: NewsService())
            FeedScene(viewModel: viewModel)
        }
    }
}
