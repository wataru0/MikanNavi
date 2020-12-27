//
//  Article.swift
//  MikanNavi
//
//  Created by 岡本航昇 on 2020/12/27.
//

import Foundation

struct Article: Codable {
    let title: String
    let user: User
}

struct User: Codable {
    let id: String
}
