//
//  String+Extension.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: .main, value: "", comment: "")
    }
    
    var asNSString: NSString {
        return self as NSString
    }
    
    var canOpenUrl: Bool {
        guard let url = URL(string: self) else { return false }
        
        return UIApplication.shared.canOpenURL(url)
    }
    
    var properPrefixUrl: String {
        if !self.contains("http") && !self.contains("https") {
            
            var fixedTitle = "http://" + self
            if fixedTitle.canOpenUrl {
                return fixedTitle
            }
            
            fixedTitle = "https://" + self
            if fixedTitle.canOpenUrl {
                return fixedTitle
            }
        }
        
        return self
    }
    
    func textWidth(for font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: attributes).width
    }
    
    func attributedString(font: UIFont, color: UIColor = .black, alignment: NSTextAlignment = .left, spacing: CGFloat = 0) -> NSAttributedString {
        let styleParagraph = NSMutableParagraphStyle()
        styleParagraph.alignment = alignment
        styleParagraph.lineSpacing = spacing
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font,
                                                          NSAttributedString.Key.foregroundColor: color,
                                                          NSAttributedString.Key.paragraphStyle: styleParagraph]
    
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
}
