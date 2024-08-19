//
//  SFSymbols.swift
//  QiitaAPI
//
//  Created by 吉原飛偉 on 2024/06/26.
//

import UIKit

extension UIImageView {
    func setImage(systemName: String, tintColor: UIColor) {
            self.image = UIImage(systemName: systemName)
            self.tintColor = tintColor
        }
}
