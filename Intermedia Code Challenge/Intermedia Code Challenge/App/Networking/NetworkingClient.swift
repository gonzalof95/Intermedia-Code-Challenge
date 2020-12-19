//
//  NetworkingClient.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 15/12/2020.
//

import Foundation
import RxSwift

class NetworkingClient {

    private var apiPubKey: String = ""
    private var hash: String = ""

    func executeGet(completion: @escaping(Result<HeroResponseModel, networkError>) -> Void) {

        guard let baseURL = URLComponents(string: NetworkingConstants.baseURL) else {
            completion(.failure(.badURL))
            return
        }

        var components = baseURL
        components.queryItems = [URLQueryItem(name: "apikey", value: apiPubKey.getAPIKey(key: NetworkingConstants.publicKey)),
                                 URLQueryItem(name: "hash", value: hash.getAPIKey(key: NetworkingConstants.hash)),
                                 URLQueryItem(name: "ts", value: "1"),
                                 URLQueryItem(name: "limit", value: "9")]

        let newUrl = URL(string: "https://gateway.marvel.com/v1/public/characters?apikey=3a783b25c80e1c44875356dd363f272d&hash=51a3ecf2f92a23817992a2663183325e&ts=1&offset=10&limit=10")!
        let request = URLRequest(url: newUrl)

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
                let responseData = try JSONDecoder().decode(HeroResponseModel.self, from: data)
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

class NetworkService {
    let baseURL = NetworkingConstants.baseURL

    func execute<T: Decodable>(url: URL) -> Observable<T> {
        
        return Observable.create { observer -> Disposable in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
