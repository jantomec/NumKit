//
//  CGExtensions.swift
//  NumKit
//
//  Created by Jan Tomec on 21/04/2019.
//  Copyright © 2019 Jan Tomec. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    init(center: CGPoint, size: CGSize) {
        self.init(origin: CGPoint(x: center.x - size.width/2,
                                  y: center.y - size.height/2),
                  size: size)
    }
}
