//
//  Constants.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/8/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants

let BASE_URL = "https://mychatychat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNEL = "\(BASE_URL)channel/"
let URL_GET_MESSAGE = "\(BASE_URL)message/byChannel"

//Segues

let To_Login = "to_login"
let To_Create = "to_createAcc"
let UnWind = "UnWindToChannel"
let To_Avatar_Picker = "toAvatarPicker"

//UserDefaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


//Headers

let Header = [
    "Content-Type": "application/json; charset=utf-8"
]

let Bearer_Header = [
    
    "Authorization":"Bearer\(AuthService.instance.authToke)",
    "Content-Type":"application/json; charset=utf-8"
]

//Colors
let SmackPurplePlaceholder = #colorLiteral(red: 0.2127874088, green: 0.2745563211, blue: 0.604041085, alpha: 0.5)

//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("ChannelsIsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("ChannelIsSelected")
