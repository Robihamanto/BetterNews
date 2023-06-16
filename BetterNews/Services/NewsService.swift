//
//  NewsService.swift
//  BetterNews
//
//  Created by Robihamanto, Robihamanto | MCPD on 6/16/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

protocol NewsServiceType {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void)
}

class NewsService: NewsServiceType {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&date=2023-06-16&sortBy=popularity&apiKey=69f601cf840e48039af03fe6aea53ce9") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil, let data else {
                completion(.failure(NetworkError.responseError))
                return
            }
            do {
                let newsResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(newsResponse.articles))
            } catch {
                print("Error", error)
                completion(.failure(NetworkError.unknown))
            }
        }.resume()
    }
}
