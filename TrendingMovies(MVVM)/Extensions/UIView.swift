//
//  UIView.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 17.04.24.
//

import Foundation
import UIKit

extension UIView {
    func round(_ radius: CGFloat = 12) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    func border(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
