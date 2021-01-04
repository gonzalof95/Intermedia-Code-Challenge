//
//  NetworkServicePotocol.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 04/01/2021.
//

import Foundation
import RxSwift

protocol NetworkServicePotocol: AnyObject {
    var publicKey: String { get }
    var hash: String { get }
    func execute<T: Decodable>(_ baseUrl: String, _ offset: Int, _ limit: Int) -> Observable<T>
    func appendQueryParams(_ baseUrl: String, _ offset: Int, _ limit: Int) -> String
}
