//
//  ModelsVC.swift
//  RememberMe
//
//  Created by Tony Jiang on 11/5/18.
//  Copyright © 2018 Tony Jiang. All rights reserved.
//

import UIKit

class Person: Codable {
    var name = Name()
    var otherInfo = OtherInfo()
    var birthday = Birthday()
    var family = [Member]()
    var dates = [ImportantDate]()
    var notes = [Note]()
    var profilePic: Data?
}

class Name: Codable {
    var first: String = ""
    var middle: String = ""
    var last: String = ""
}

class Birthday: Codable {
    var date: Date?
    var uid: String!
}

class Member: Codable {
    var name: String = ""
    var relationship: String = ""
}

class ImportantDate: Codable {
    var date: Date?
    var name: String?
    var uid: String!
}

class Note: Codable {
    var note: String?
    var uid: String!
}

class OtherInfo: Codable {
    var email: String?
    var phone: String?
    var occupation: String?
    var location: String?
    
    func allNilFields() -> Bool {
        return !([email, phone, location, occupation].compactMap({ $0 == nil}).contains(false))
    }
}

class Env {
    static var iPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
