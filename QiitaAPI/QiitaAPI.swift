//
//  QiitaAPI.swift
//  QiitaAPI
//
//  Created by 吉原飛偉 on 2024/06/26.
//

import Foundation

class QiitaAPI {
    //URLSessionTaskは、ネットワークリクエストを表すクラス
    private static var task: URLSessionTask?
    
    enum FetchArticleError: Error {
        case wrong
        case network
        case parse
    }
    
    static func fetchArticle(query: String, completionHandler: @escaping (Result<[Article], FetchArticleError>) -> Void) {
        if !query.isEmpty {
            //URL作成
            let url = "https://qiita.com/api/v2/items"
            guard var urlComponents = URLComponents(string: url) else {
                return
            }
            urlComponents.queryItems = [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "per_page", value: "50")
            ]
            
            let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
                if error != nil {
                    completionHandler(.failure(FetchArticleError.network))
                    return
                }
                
                guard let safeData = data else {return}
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let decodedData = try decoder.decode([Article].self, from: safeData)
                    completionHandler(.success(decodedData))
                    print(decodedData)
                } catch {
                    completionHandler(.failure(FetchArticleError.parse))
                    print(error)
                }
            }
            task.resume()
        }
    }
    static func taskCancel() {
        task?.cancel()
    }
}
