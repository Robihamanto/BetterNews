//
//  Article.swift
//  BetterNews
//
//  Created by Robihamanto, Robihamanto | MCPD on 6/16/23.
//

import Foundation

// MARK: - APIReponse
struct APIResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {

    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String
}
