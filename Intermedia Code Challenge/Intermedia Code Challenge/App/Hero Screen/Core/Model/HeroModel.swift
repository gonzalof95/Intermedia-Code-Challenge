//
//  HeroModel.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 14/12/2020.
//

struct HeroResponseModel: Decodable {
    let code: Int
    let data: HeroResponseData
}

struct HeroResponseData: Decodable {
    let offset: Int
    let limit: Int
    let count: Int
    let results: [HeroModel]
}

struct HeroModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: ThumbnailModel
}

struct ThumbnailModel: Decodable {
    let path: String
    let imageExtension: String

    public enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}
