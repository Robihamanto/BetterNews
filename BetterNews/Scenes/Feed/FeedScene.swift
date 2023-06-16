//
//  ContentView.swift
//  BetterNews
//
//  Created by Robihamanto, Robihamanto | MCPD on 6/16/23.
//

import SwiftUI

struct FeedScene: View {

    let viewModel: FeedViewModelType

    init(viewModel: FeedViewModelType) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            ForEach(viewModel.articles) { article in
                Text(article.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FeedViewModel(newsService: NewsService())
        FeedScene(viewModel: viewModel)
    }
}
