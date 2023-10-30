//
//  Contact.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/5/23.
//

import Foundation
import UIKit

struct Contact{
    var name: String?
    var email: String?
    var phoneType: String?
    var phone: Int?
    var address: String?
    var cityState: String?
    var zip: Int?
    var image: UIImage?
    
    init(name: String? = nil, email: String? = nil, phoneType: String? = nil, phone: Int? = nil, address: String? = nil, cityState: String? = nil, zip: Int? = nil, image: UIImage? = nil) {
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phone = phone
        self.address = address
        self.cityState = cityState
        self.zip = zip
        self.image = image
    }
}
