//
//  Article.swift
//  QiitaAPI
//
//  Created by 吉原飛偉 on 2024/06/26.
//

import Foundation
import UIKit

//レスポンスしたデータをデコードするためのArticleを作成

struct Article: Codable {
    let title: String
    let url: String
    let user: User
    let likesCount: Int
    let createdAt: String

    enum CoddingKeys: String, CodingKey {
        case likesCount = "likescount"
        case createdAt = "createdat"
    }
}

struct User: Codable {
    let id: String
    let name: String
    let profileImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profileImageUrl = "profileImageUrl"
    }
}
