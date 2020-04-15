//
//  EmptyDataView.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 26/03/2019.
//  Copyright © 2019 Altconnect. All rights reserved.
//

import UIKit

class EmptyDataView: UIView {
    
    // MARK: - Properties
    
    private lazy var contentView: EmptyDataContentView = {
        let view = EmptyDataContentView()
        addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    private lazy var contentViewCenterX: NSLayoutConstraint = {
        return contentView.centerXAnchor.constrain(anchor: safeAreaLayoutGuide.centerXAnchor, isActive: false)
    }()
    
    private lazy var contentViewCenterY: NSLayoutConstraint = {
        return contentView.centerYAnchor.constrain(anchor: safeAreaLayoutGuide.centerYAnchor, isActive: false)
    }()
    
    var contentOffset: CGPoint = .zero {
        didSet {
            contentViewCenterX.constant = contentOffset.x
            contentViewCenterY.constant = contentOffset.y
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupAutoLayout()
    }
}

// MARK: - Setup

extension EmptyDataView {
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([contentViewCenterY, contentViewCenterX])
    }
    
    func configure(type: EmptyDataType, contentOffset: CGPoint) {
    }
}
