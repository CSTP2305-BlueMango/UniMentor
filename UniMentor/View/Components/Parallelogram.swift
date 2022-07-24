//
//  Parallelogram.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

// reference: https://levelup.gitconnected.com/parallelogram-shape-and-mask-tutorial-7473a4135483
/// background shape
struct Parallelogram: Shape {
    /// depth of parallelogram
    var depth: CGFloat
    /// parallelogram flipped state
    var flipped: Bool = false
    
    /// parallogram shape
    func path(in rect: CGRect) -> Path {
        Path { p in
            if flipped {
                p.move(to: CGPoint(x: 0, y: 0))
                p.addLine(to: CGPoint(x: rect.width, y: depth))
                p.addLine(to: CGPoint(x: rect.width, y: rect.height))
                p.addLine(to: CGPoint(x: 0, y: rect.height - depth))
            } else {
                p.move(to: CGPoint(x: 0, y: depth))
                p.addLine(to: CGPoint(x: rect.width, y: 0))
                p.addLine(to: CGPoint(x: rect.width, y: rect.height - depth))
                p.addLine(to: CGPoint(x: 0, y: rect.height))
            }
            p.closeSubpath()
        }
    }
}
