//
//  ViewController.swift
//  TrySetLayerContentWithImage
//
//  Created by Howard Yeh on 2014-09-04.
//  Copyright (c) 2014 Howard Yeh. All rights reserved.
//

import UIKit

private let kingImage = UIImage(named: "king_of_spades").CGImage
private let queenImage = UIImage(named: "queen_of_spades").CGImage

class ViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }

    func setupView() {
        var l = CALayer(); view.layer.addSublayer(l)
        l.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        l.contents = kingImage
        l.borderColor = UIColor(white: 0.8, alpha: 1).CGColor
        l.borderWidth = 1

        l = CALayer(); view.layer.addSublayer(l)
        l.frame = CGRect(x: 50, y: 270, width: 200, height: 200)
        l.contents = queenImage
        l.borderColor = UIColor(white: 0.8, alpha: 1).CGColor
        l.contentsGravity = kCAGravityResizeAspect
        l.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

