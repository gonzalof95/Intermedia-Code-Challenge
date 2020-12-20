//
//  EventsModel.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

struct EventsResponseModel: Decodable {
    let code: Int
    let data: EventsResponseData
}

struct EventsResponseData: Decodable {
    let offset: Int
    var limit: Int
    let count: Int
    let results: [EventsModel]
}

struct EventsModel: Decodable {
    let title: String?
    let start: String?
    let end: String?
    let thumbnail: ThumbnailModel
    let stories: StoriesModel
}

struct StoriesModel: Decodable {
    let items: [StoriesItemModel]
}

struct StoriesItemModel: Decodable {
    let name: String
    let type: String
}
