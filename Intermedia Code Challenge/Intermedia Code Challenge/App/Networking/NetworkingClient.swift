//
//  NetworkingClient.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 15/12/2020.
//

import Foundation

class NetworkingClient {

    private var apiPubKey: String = ""
    private var hash: String = ""

    func executeGetToken(completion: @escaping(Result<HeroModel, networkError>) -> Void) {

        guard let baseURL = URLComponents(string: Constants.baseURL) else {
            completion(.failure(.badURL))
            return
        }

        var components = baseURL
        components.queryItems = [URLQueryItem(name: "apikey", value: apiPubKey.getAPIKey(key: Constants.publicKey)),
                                 URLQueryItem(name: "hash", value: hash.getAPIKey(key: Constants.hash)),
                                 URLQueryItem(name: "ts", value: "1")]
        let request = URLRequest(url: components.url!)

        print("-----------------------------------------------------------------")
        print("Request Start:")
        print("URL: ", request)

        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if (err != nil) {
                completion(.failure(.requestError))
            }

            guard let data = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            print("JSON String: \(String(describing: String(data: data, encoding: .utf8)))")

            do {
                let responseData = try JSONDecoder().decode(HeroModel.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(.canNotProcessData))
            }
            print("Request End")
            print("-----------------------------------------------------------------")
        }.resume()
    }
}

enum networkError: Error {
    case badURL
    case requestError
    case noDataAvailable
    case canNotProcessData
}
