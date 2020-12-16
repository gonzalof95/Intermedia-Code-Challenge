//
//  ResponseModel.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 15/12/2020.
//

struct ResponseModel: Decodable {
    let code: Int
    let responseData: ResponseData

    public enum CodingKeys: String, CodingKey {
        case code
        case responseData = "data"
    }
}

struct ResponseData: Decodable {
    let offset: Int
    let limit: Int
    let count: Int
    let results: [HeroModel]
}
