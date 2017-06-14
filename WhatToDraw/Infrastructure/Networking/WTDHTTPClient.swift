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
            return "/592c76eb110000c0066df85f"
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
            return "{\"latitude\": 45.45 , \"longitude\": 564.456}".data(using: String.Encoding.utf8)!
        case .getUser:
            return "".data(using: String.Encoding.utf8)!
        }
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
