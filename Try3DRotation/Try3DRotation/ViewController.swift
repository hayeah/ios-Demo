//
//  ViewController.swift
//  Try3DRotation
//
//  Created by Howard Yeh on 2014-09-04.
//  Copyright (c) 2014 Howard Yeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider.maximumValue = Float(M_PI)
        slider.minimumValue = 0
        slider.value = 0

        setup()
    }

    var topLayer : CATransformLayer!
    func setup() {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        container.center = view.center
        container.layer.borderColor = UIColor.redColor().CGColor
        container.layer.borderWidth = 1

        topLayer = CATransformLayer()
        container.layer.addSublayer(topLayer)
        topLayer.frame = container.bounds

        // Add a background layer, the same size as container.
        var l = CALayer()
        topLayer.addSublayer(l)
        // If frame is not set, will rotate about (0,0) of container
        l.frame = topLayer.frame
        l.backgroundColor = UIColor.grayColor().CGColor

        let I = CATransform3DIdentity
        var t = CATransform3DIdentity

        // Add a layer behind the background layer.
        l = CALayer()
        topLayer.addSublayer(l)
        l.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        l.backgroundColor = UIColor.redColor().CGColor
        l.transform = CATransform3DTranslate(I, -20, -20, -20)

        // Add a layer in front of the background layer.
        l = CALayer()
        topLayer.addSublayer(l)
        l.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        l.backgroundColor = UIColor.blueColor().CGColor
        l.transform = CATransform3DTranslate(I, 20, 20, 40)


        view.addSubview(container)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Rotate the transform layer
    func updateRotation() {
        let angle = slider.value
        var t = CATransform3DIdentity
        t = CATransform3DRotate(t, CGFloat(angle), 0, 1, 0)
        topLayer.transform = t
    }

    @IBAction func sliderChanged(sender: AnyObject) {
        updateRotation()
    }

}

