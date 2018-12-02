//
//  Channel.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/21/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import Foundation

struct Channel {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}

        //OR

//struct Channel : Decodable {
//    public private(set) var _id: String!
//    public private(set) var name: String!
//    public private(set) var description: String!
//    public private(set) var __v: Int!
//}

//With the comment Code at MessageService ^^
