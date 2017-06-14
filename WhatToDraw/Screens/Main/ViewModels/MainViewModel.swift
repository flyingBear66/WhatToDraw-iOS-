//
//  MainViewModel.swift
//  WhatToDraw
//
//  Created by Ozgun Zor on 14/06/2017.
//  Copyright © 2017 Ozgun Zor. All rights reserved.
//

import Moya
import Moya_ObjectMapper
import CocoaLumberjack
import RxSwift
import Foundation

class MainViewModel: WTDViewModel {
    
    var location: Variable<LocationModel>!
    
    func getLocationsSecond() {
        provider.request(.getLokmas).subscribe { event in
            switch event {
            case .next(let response):
                DDLogInfo(response.debugDescription)
            case .error(let error):
                DDLogError(error.localizedDescription)
            default:
                break
            }
        }
    }
}
