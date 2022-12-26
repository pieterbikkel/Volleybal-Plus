//
//  ProductImagesCacheManager.swift
//  Volleybal Plus
//
//  Created by Pieter Bikkel on 26/12/2022.
//

import Foundation
import SwiftUI

class TeamImagesCacheManager {
    
    static let instance = TeamImagesCacheManager()
    
    private init() {}
    
    var teamImageCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100Mb
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        teamImageCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return teamImageCache.object(forKey: key as NSString)
    }
    
}

