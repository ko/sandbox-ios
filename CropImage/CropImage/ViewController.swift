//
//  ViewController.swift
//  CropImage
//
//  Created by Ken Ko on 8/5/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cropView: PECropView?
    let thisImage = UIImage(named: "test")
    var cropImage: UIImage?
    var cropImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        doCrop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func btnOkTouch() {
        self.cropImage = self.cropView!.croppedImage
        
        self.cropView?.removeFromSuperview()
        
        self.cropImageView = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width, self.view.bounds.height-100))
        self.cropImageView!.image = self.cropImage
        self.view.addSubview(self.cropImageView)
    }
    
    func doCrop() {

        let btnOk = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btnOk.setTitle("hi", forState: UIControlState.Normal)
        btnOk.frame = CGRectMake(0,self.view.bounds.height - 100,100,100)
        btnOk.addTarget(self, action: "btnOkTouch", forControlEvents: UIControlEvents.TouchDown)
        
        self.cropView = PECropView(frame: CGRectMake(0,0,self.view.bounds.width, self.view.bounds.height-100))
        self.cropView!.image = self.thisImage
        
        
        self.view.addSubview(cropView)
        self.view.addSubview(btnOk)
        
    }
}
