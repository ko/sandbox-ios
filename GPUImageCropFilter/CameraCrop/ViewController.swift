//
//  ViewController.swift
//  CameraCrop
//
//  Created by Ken Ko on 8/4/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit
import GPUImage


class ViewController: UIViewController {
 
    
    var videoCamera:GPUImageVideoCamera?
    var filter:GPUImageCropFilter?
    @IBOutlet var imageView: GPUImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        doCrop();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func doCrop() {
        
        imageView = GPUImageView(frame: CGRectMake(0,0,300,500))
        self.view.addSubview(imageView)
        
        videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset640x480, cameraPosition: .Back)
        
        videoCamera!.outputImageOrientation = .Portrait;
        
        filter = GPUImageCropFilter(cropRegion: CGRectMake(0, 0.12, 1, 0.75))
        
        videoCamera?.addTarget(filter)
        
        filter?.addTarget(self.imageView as GPUImageView)
        
        videoCamera?.startCameraCapture()
        
    }
}
