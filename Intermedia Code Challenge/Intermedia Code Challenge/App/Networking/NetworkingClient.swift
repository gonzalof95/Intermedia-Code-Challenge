//
//  NetworkingClient.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 15/12/2020.
//

import Foundation
import RxSwift
import Alamofire

class NetworkService {
    private var publicKey: String = ""
    private var hash: String = ""

    func execute<T: Decodable>(_ baseUrl: String, _ offset: Int = 0, _ limit: Int) -> Observable<T> {
        let url = appendQueryParams(baseUrl, offset, limit)

        return Observable.create { observer -> Disposable in

            AF.request(url)
                .validate().responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? networkError.notFound)
                            return
                        }
                        do {
                            let responseData = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(responseData)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                           let reason = networkError(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }

    func appendQueryParams(_ baseUrl: String, _ offset: Int, _ limit: Int) -> String {
        publicKey = publicKey.getAPIKey(key: NetworkingConstants.publicKey)
        hash = hash.getAPIKey(key: NetworkingConstants.hash)

        let url = baseUrl + "?" +
                "apikey=" + "3a783b25c80e1c44875356dd363f272d" + "&" +
                "hash=" + "51a3ecf2f92a23817992a2663183325e" + "&" +
                "ts=" + "1" + "&" +
                "offset=" + "\(offset)" + "&" +
                "limit=" + "\(limit)"

        return url
    }

    enum networkError: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
}
