//
//  FullCircleViewController.swift
//  ZenMenu-Example
//
//  Created by Tanner Juby on 1/3/18.
//  Copyright © 2018 ZenBanana. All rights reserved.
//

import Foundation
import UIKit
import ZenMenu

class FullCircleViewController: UIViewController {
    
    // MARK: - UIOutlets and Variables
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var menuButton: ZenMenu!
    
    
    // MARK: - Class Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Create ZenMenuItems
        
        // Size that I want the ZenMenuItem to be
        let itemSize = CGSize(width: 100, height: 100)
        
        // Initialize custom view (MenuButtonItem) to be used for the first ZenMenuItem
        let item1View = MenuButtonItem.instanceFromNib(title: "Quarter", icon: UIImage(named: "Quarter")!, mainColor: UIColor.clear)
        item1View.titleLabel.textColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        // Initialize first ZenMenuItem using the first custom view
        let item1 = ZenMenuItem(customItemView: item1View, withSize: itemSize)
        
        // Initialize custom view (MenuButtonItem) to be used for the second ZenMenuItem
        let item2View = MenuButtonItem.instanceFromNib(title: "Half", icon: UIImage(named: "Half")!, mainColor: UIColor.clear)
        item2View.titleLabel.textColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)

        // Initialize second ZenMenuItem using the second custom view
        let item2 = ZenMenuItem(customItemView: item2View, withSize: itemSize)
        
        // Initialize custom view (MenuButtonItem) to be used for the third ZenMenuItem
        let item3View = MenuButtonItem.instanceFromNib(title: "Full", icon: UIImage(named: "Full")!, mainColor: UIColor.clear)
        item3View.titleLabel.textColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)

        // Initialize third ZenMenuItem using the third custom view
        let item3 = ZenMenuItem(customItemView: item3View, withSize: itemSize)
        
        
        // MARK: Assign ZenMenu's programmable attributes
        
        // set the View Controller view as the menuButton's parent view
        menuButton.parentView = self.view
        
        // set the menuButton's items
        menuButton.items = [item1, item2, item3]
        
        // set the direction of where the first ZenMenuItem will be displayed in reference to the ZenMenu
        menuButton.direction = .north
        
        // Set the type of ZenMenu that will be used
        menuButton.type = .fullCircle
        
        // Set the delegate for the menuButton
        menuButton.delegate = self
        
        
        // MARK: Finish initialization of ZenMenu
        
        menuButton.commonInit()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    // MARK: UIActions
    
    @IBAction func backButtonSelected(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}


extension FullCircleViewController: ZenMenuDelegate {
    
    // Add animation to the ZenMenuItems as they open
    func zenMenu(_ zenMenu: ZenMenu, willPresentZenMenuItem zenMenuItem: ZenMenuItem, index: Int) {
        zenMenuItem.zenMenuSpinClockwise(duration: 0.3)
    }
    
    // Add animation to the ZenMenuItems as they close
    func zenMenu(_ zenMenu: ZenMenu, willDismissZenMenuItem zenMenuItem: ZenMenuItem, index: Int) {
        zenMenuItem.zenMenuSpinCounterClockwise(duration: 0.3)
    }
    
    // Navigate to view controller represented by selected ZenMenuItem
    func zenMenu(_ zenMenu: ZenMenu, didSelectZenMenuItem zenMenuItem: ZenMenuItem, index: Int) {
        
        switch index {
        case 0:
            // Navigate to the quarter circle view controller
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "QuarterCircle") as! QuarterCircleViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            // Navigate to the half circle view controller
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HalfCircle") as! HalfCircleViewController
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            // Already on the full circle view controller, simply close the menu
            zenMenu.close()
            
        }
    }
    
    
}
