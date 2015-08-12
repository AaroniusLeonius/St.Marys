//
//  SycamoreConstants.swift
//  SycamoreAPI
//
//  Created by Drew Rosenberg on 10/20/14.
//  Copyright (c) 2014 Drew Rosenberg. All rights reserved.
//

import Foundation

let AUTH_URL = "https://app.sycamoreeducation.com/oauth/authorize.php"
let API_URL = "https://app.sycamoreeducation.com/api/v1/"
let authenticateURL = NSURL(string:(AUTH_URL + "?response_type=token&client_id=\(CLIENT_ID)&scope=open general individual&redirect_uri=\(REDIRECT_URI)").stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
