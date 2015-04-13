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
    @IBOutlet var imageView: UIImageView!
    var currentColor: UIColor = UIColor.blackColor()
    var previousPoint: CGPoint?
    var brush: CGFloat = 5
    
    @IBAction func selectColorButtonTapped(sender: UIButton) {
        currentColor = selectColorButtons[sender.tag].backgroundColor!
    }
    
    @IBAction func clearBoardTapped(sender: UIButton) {
        imageView.image = nil
    }
    
    @IBAction func brushSliderChanged(sender: UISlider) {
        brush = CGFloat(sender.value)
    }
    
    @IBAction func panGestureDetected(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(view)
        switch sender.state {
        case .Began:
            previousPoint = location
        case .Changed:
            drawLine(point1: previousPoint!, point2: location)
            previousPoint = location
        case .Ended:
            drawLine(point1: previousPoint!, point2: location)
        default:
            break
        }
    }
    
    private func drawLine(#point1: CGPoint, point2: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        if imageView.image == nil {
            imageView.image = UIImage()
        }
        imageView.image!.drawInRect(view.bounds)
        let context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, point1.x, point1.y)
        CGContextAddLineToPoint(context, point2.x, point2.y)
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, brush)
        CGContextSetStrokeColorWithColor(context, currentColor.CGColor)
        CGContextStrokePath(context)
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
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

