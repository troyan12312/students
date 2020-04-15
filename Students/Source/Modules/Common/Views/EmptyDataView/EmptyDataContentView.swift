//
// Created by Dawid Trojanowski on 2019-08-16.
// Copyright (c) 2019 Altconnect. All rights reserved.
//

import UIKit

final class EmptyDataContentView: UIView {

    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
    }
}
