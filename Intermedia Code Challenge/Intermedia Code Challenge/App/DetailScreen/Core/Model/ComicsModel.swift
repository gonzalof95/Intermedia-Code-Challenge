//
//  ComicsModel.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

struct ComicsListModel: Decodable {
    let comics: [ComicModel]

    public enum CodingKeys: String, CodingKey {
        case comics = "items"
    }
}

struct ComicModel: Decodable {
    let name: String
}
