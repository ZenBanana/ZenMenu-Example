//
//  MenuButtonItem.swift
//  LoveNowProject
//
//  Created by Tanner Juby on 8/22/17.
//  Copyright © 2017 ZenBanana LLP. All rights reserved.
//

import Foundation
import UIKit

struct MenuItem {
    var title: String!
    var icon: UIImage!
    
    var iconImageInset: CGFloat = 0
    
    var iconBackgroundColor: UIColor?
    var backgroundColor: UIColor?
    
    init(title: String, icon: UIImage, iconImageInset: CGFloat? = 0, backgroundColor: UIColor? = nil, iconBackgroundColor: UIColor? = UIColor.clear) {
        self.title = title
        self.icon = icon
        self.iconImageInset = iconImageInset!
        self.backgroundColor = backgroundColor
        self.iconBackgroundColor = iconBackgroundColor
    }
}

open class MenuButtonItem: UIView {
    
    // MARK: - Class Variables
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconButton: UIButton!
    @IBOutlet weak var iconBackground: UIView!
    
    let backgroundView = UIView()
    var isBackgroundReady = false
    var isPresented = false
    
    // MARK: - Class Initializer
    
    class func instanceFromNib(title: String, icon: UIImage, mainColor: UIColor) -> MenuButtonItem {
        
        let view = UINib(nibName: "MenuButtonItem", bundle: nil).instantiate(withOwner: MenuButtonItem(), options: nil)[0] as! MenuButtonItem
                view.titleLabel.text = title
        view.iconButton.setImage(icon, for: .normal)
        view.iconButton.contentMode = .scaleAspectFit
        view.iconButton.isUserInteractionEnabled = false
        view.iconBackground.backgroundColor = mainColor
        
        view.autoresizesSubviews = false
        
        return view
    }
}

