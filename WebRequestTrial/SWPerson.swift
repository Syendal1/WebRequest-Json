//
//  SWPerson.swift
//  WebRequestTrial
//
//  Created by SnehithNitin on 8/3/16.
//  Copyright © 2016 Snehith. All rights reserved.
//
import Foundation

class SWPerson {
    private var _name: String!
    private var _height: String!
    private var _gender: String!
    
    var name: String {
        return _name
    }
    
    var height: String {
        get {
            return _height
        }
    }
    
    var gender: String {
        return _gender
    }
    
    init(name: String, height: String, gender:String) {
        _name = name
        _height = height
        _gender = gender
    }
}
