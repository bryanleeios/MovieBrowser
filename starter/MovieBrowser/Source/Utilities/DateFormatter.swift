//
//  DateFormatter.swift
//  MovieBrowser
//
//  Created by Bryan Lee on 9/16/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

let dateFormatterInput: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
}()

let dateFormatterDisplay: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy"
    return dateFormatter
}()
    
