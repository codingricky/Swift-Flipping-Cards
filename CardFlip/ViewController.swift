//
//  ViewController.swift
//  CardFlip
//
//  Created by Ricky Yim on 30/07/2014.
//  Copyright (c) 2014 Ricky Yim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cardView: UIView!
    var backImageView: UIImageView!
    var cardImageView: UIImageView!
    
    var showingBack = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImageView = UIImageView(image: UIImage(named: "c01.png"))
        backImageView = UIImageView(image: UIImage(named: "Card-Back-01.png"))

        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        singleTap.numberOfTapsRequired = 1

        let rect = CGRectMake(20, 20, backImageView.image.size.width, backImageView.image.size.height)
        cardView = UIView(frame: rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.userInteractionEnabled = true
        cardView.addSubview(backImageView)
        cardView.sizeToFit()
    
        view.addSubview(cardView)
    }

    func tapped() {
        if (showingBack) {
            UIView.transitionFromView(backImageView, toView: cardImageView, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack = false
        } else {
            UIView.transitionFromView(cardImageView, toView: backImageView, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack = true
        }

    }

}

