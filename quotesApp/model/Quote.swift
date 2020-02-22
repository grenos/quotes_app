//
//  Quote.swift
//  quotesApp
//
//  Created by Vasileios Gkreen on 30/01/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import Foundation
import SwiftUI

// hashable is like identifiable but more generic
struct Quote : Hashable, Decodable {
//    var id = UUID() ---> identifiable
    var quote : String
    var name : String
}
