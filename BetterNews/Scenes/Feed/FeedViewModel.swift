//
//  FeedViewModel.swift
//  BetterNews
//
//  Created by Robihamanto, Robihamanto | MCPD on 6/16/23.
//

import Foundation
import Combine

protocol FeedViewModelType {
    var newsService: NewsServiceType { get set }
    var articles: [ArticleRowViewModel] { get set }
    func fetchNews()
}

class FeedViewModel: FeedViewModelType {

    var newsService: NewsServiceType
    @Published var articles: [ArticleRowViewModel] = []

    init(newsService: NewsServiceType) {
        self.newsService = newsService
        fetchNews()
    }

    func fetchNews() {
        newsService.fetchNews { [weak self] result in
            switch result {
            case.success(let articles):
                self?.articles = articles.map{ ArticleRowViewModel(title: $0.title, description: $0.description) }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ArticleRowViewModel: Identifiable {
    var id = UUID()
    let title: String
    let description: String
}
