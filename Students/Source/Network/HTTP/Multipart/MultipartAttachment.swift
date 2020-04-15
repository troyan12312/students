//
//  MultipartAttachment.swift
//  CRP
//
//  Created by Robert Mietelski on 15.10.2018.
//  Copyright © 2018 altconnect. All rights reserved.
//

import Foundation

struct MultipartAttachment {
    
    // MARK: - Content types
    
    enum ContentType: String {
        case text = "text"
        case image = "image"
        case audio = "audio"
        case video = "video"
        case application = "application"
    }
    
    // MARK: - Public attributes
    
    var url: URL?
    var name: String
    var contentType: ContentType
    
    // MARK: Initialization
    
    init(url: URL?, name: String, contentType: ContentType) {
        self.url = url
        self.name = name
        self.contentType = contentType
    }
    
    static func text(url: URL?, name: String) -> MultipartAttachment {
        return MultipartAttachment(url: url, name: name, contentType: .text)
    }

    static func image(url: URL?, name: String) -> MultipartAttachment {
        return MultipartAttachment(url: url, name: name, contentType: .image)
    }
    
    static func audio(url: URL?, name: String) -> MultipartAttachment {
        return MultipartAttachment(url: url, name: name, contentType: .audio)
    }
    
    static func video(url: URL?, name: String) -> MultipartAttachment {
        return MultipartAttachment(url: url, name: name, contentType: .video)
    }
    
    static func application(url: URL?, name: String) -> MultipartAttachment {
        return MultipartAttachment(url: url, name: name, contentType: .application)
    }
}
