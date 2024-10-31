//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 17.06.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
}

extension UIDevice {
    static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
}
