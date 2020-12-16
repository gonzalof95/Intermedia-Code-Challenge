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

    func executeGetToken(completion: @escaping(Result<ResponseModel, networkError>) -> Void) {

        guard let baseURL = URLComponents(string: NetworkingConstants.baseURL) else {
            completion(.failure(.badURL))
            return
        }

        var components = baseURL
        components.queryItems = [URLQueryItem(name: "apikey", value: apiPubKey.getAPIKey(key: NetworkingConstants.publicKey)),
                                 URLQueryItem(name: "hash", value: hash.getAPIKey(key: NetworkingConstants.hash)),
                                 URLQueryItem(name: "ts", value: "1"),
                                 URLQueryItem(name: "limit", value: "9")]
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
            //print("JSON String: \(String(describing: String(data: data, encoding: .utf8)))")
            do {
                let responseData = try JSONDecoder().decode(ResponseModel.self, from: data)
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
