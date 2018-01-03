//
//  ViewController.swift
//  ZenMenu-Example
//
//  Created by Tanner Juby on 1/3/18.
//  Copyright © 2018 ZenBanana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UIOutlets and Variables
    
    @IBOutlet weak var fullCircleButton: UIButton!
    @IBOutlet weak var halfCircleButton: UIButton!
    @IBOutlet weak var quarterCircleButton: UIButton!
    
    
    // MARK: - Class Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Subview Modifications
        fullCircleButton.roundCorners(withRadius: fullCircleButton.frame.height / 2)
        halfCircleButton.roundCorners(withRadius: halfCircleButton.frame.height / 2)
        quarterCircleButton.roundCorners(withRadius: quarterCircleButton.frame.height / 2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UIActions
    
    @IBAction func fullCircleButtonSelected(_ sender: Any) {
        // Navigate to the full circle view controller
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FullCircle") as! FullCircleViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func halfCircleButtonSelected(_ sender: Any) {
        // Navigate to the half circle view controller
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HalfCircle") as! HalfCircleViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func quarterCircleButtonSelected(_ sender: Any) {
        // Navigate to the quarter circle view controller
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuarterCircle") as! QuarterCircleViewController
        navigationController?.pushViewController(vc, animated: true)
    }

}

