//
//  ViewController.swift
//  DrawingBoard
//
//  Created by Sihao Lu on 4/12/15.
//  Copyright (c) 2015 DJ.Ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var selectColorButtons: [UIButton]!
    
    @IBAction func selectColorButtonTapped(sender: UIButton) {
    
    }
    
    @IBAction func panGestureDetected(sender: UIPanGestureRecognizer) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

