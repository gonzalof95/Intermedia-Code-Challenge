//
//  ComicsModel.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

struct ComicsResponseModel: Decodable {
    let code: Int
    let data: ComicsResponseData
}

struct ComicsResponseData: Decodable {
    let offset: Int
    var limit: Int = 0
    let count: Int
    let results: [ComicsModel]
}

struct ComicsModel: Decodable {
    let id: Int
    let title: String
}
