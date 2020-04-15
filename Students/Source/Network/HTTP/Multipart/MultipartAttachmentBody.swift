//
//  MultipartAttachmentBody.swift
//  CRP
//
//  Created by Robert Mietelski on 15.10.2018.
//  Copyright © 2018 altconnect. All rights reserved.
//

import Foundation

public struct MultipartAttachmentBody {
    
    // MARK: - Public attributes
    
    var data: Data?
    var name: String
    var fileName: String?
    var mimeType: String
    
    // MARK: Initialization

    init(data: Data? = nil, name: String, fileName: String? = nil, mimeType: String) {
        self.data = data
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
}
