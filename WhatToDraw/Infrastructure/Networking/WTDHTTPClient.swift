//
//  ZORHTTPClient.swift
//  MvvmStarterSwiftProject
//
//  Created by Ozgun Zor on 28/05/2017.
//  Copyright © 2017 Ozgun Zor. All rights reserved.
//

import Moya
import Moya_ObjectMapper
import RxOptional
import UIKit

// MARK: - Provider setup
private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data //fallback to original data if it cant be serialized
    }
}

let MockyProvider = MoyaProvider<Mocky>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])


// MARK: - Provider support
private extension String {
    var urlEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum Mocky {
    case getLokmas
    case getUser
}

extension Mocky: TargetType {
    /// The method used for parameter encoding.
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .getLokmas, .getUser:
            return URLEncoding.default
        }
    }

    /// The HTTP method used in the request.
    public var method: Moya.Method {
        switch self {
        case .getLokmas, .getUser:
            return .get
        }
    }

    public var baseURL: URL { return URL(string: "http://www.mocky.io/v2")! }
    public var path: String {
        switch self {
        case .getLokmas:
            return "/"
        case .getUser:
            return "/"
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
            
        default:
            return nil
        }
    }
    
    public var task: Task {
        switch self {
        case .getUser, .getLokmas:
            return .request
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .getLokmas:
            return "".data(using: String.Encoding.utf8)!
        case .getUser:
            return "".data(using: String.Encoding.utf8)!
        }
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
