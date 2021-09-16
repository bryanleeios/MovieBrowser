//
//  ImageCache.swift
//  MovieBrowser
//
//  Created by Bryan Lee on 9/16/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private init() {}
    var nsCache: NSCache<NSString, UIImage> = NSCache()
    
    func read(imageStr: String) -> UIImage? {
        let nsString = imageStr as NSString
        return nsCache.object(forKey: nsString)
    }
    
    func write(imageStr: String, image: UIImage) {
        let nsString = imageStr as NSString
        nsCache.setObject(image, forKey: nsString)
    }
}
