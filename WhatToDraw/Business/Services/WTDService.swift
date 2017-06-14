//
//  ZORService.swift
//  MvvmStarterSwiftProject
//
//  Created by Ozgun Zor on 28/05/2017.
//  Copyright © 2017 Ozgun Zor. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import CocoaLumberjack


class WTDService {
    
    fileprivate let provider = RxMoyaProvider<Mocky>()
    
    func getLocations() -> Observable<LocationModel> {
        return provider.request(.getLokmas).mapObject(LocationModel.self)
    }
    

    
}
