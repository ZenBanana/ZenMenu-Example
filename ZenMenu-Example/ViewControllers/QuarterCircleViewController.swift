//
//  QuarterCircleViewController.swift
//  ZenMenu-Example
//
//  Created by Tanner Juby on 1/3/18.
//  Copyright © 2018 ZenBanana. All rights reserved.
//

import Foundation
import UIKit
import ZenMenu

class QuarterCircleViewController: UIViewController {
    
    // MARK: - UIOutlets and Variables
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var menuButton: ZenMenu!
    
    
    // MARK: - Class Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Create ZenMenuItems
        
        // Size that I want the ZenMenuItem to be
        let itemSize = CGSize(width: 65, height: 65)
        
        // Initialize first ZenMenuItem using a String
        let item1 = ZenMenuItem(title: "Quarter", withSize: itemSize, backgroundColor: UIColor.ZBRed(), titleColor: UIColor.ZBDarkBlue())
        
        // Initialize second ZenMenuItem using a String
        let item2 = ZenMenuItem(title: "Half", withSize: itemSize, backgroundColor: UIColor.ZBLightBlue(), titleColor: UIColor.ZBDarkBlue())
        
        // Initialize third ZenMenuItem using a String
        let item3 = ZenMenuItem(title: "Full", withSize: itemSize, backgroundColor: UIColor.ZBYellow(), titleColor: UIColor.ZBDarkBlue())
        
        
        // MARK: Assign ZenMenu's programmable attributes
        
        // set the View Controller view as the menuButton's parent view
        menuButton.parentView = self.view
        
        // set the menuButton's items
        menuButton.items = [item1, item2, item3]
        
        // set the direction of where the first ZenMenuItem will be displayed in reference to the ZenMenu
        menuButton.direction = .west
        
        // Set the type of ZenMenu that will be used
        menuButton.type = .quarterCircle
        
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


extension QuarterCircleViewController: ZenMenuDelegate {
    
    // Make the view a circle
    func zenMenu(_ zenMenu: ZenMenu, willPrepareZenMenuItem zenMenuItem: ZenMenuItem, index: Int) {
        zenMenuItem.makeCircle()
    }
    
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
        case 1:
            // Navigate to the half circle view controller
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HalfCircle") as! HalfCircleViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            // Navigate to the full circle view controller
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FullCircle") as! FullCircleViewController
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            // Already on the quarter circle view controller, simply close the menu
            zenMenu.close()
            
        }
    }
    
}

