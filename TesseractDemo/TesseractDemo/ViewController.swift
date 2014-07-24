//
//  ViewController.swift
//  TesseractDemo
//
//  Created by Ken Ko on 7/23/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var tess: Tesseract = Tesseract(language: "eng")
        tess.delegate = self
        tess.setVariableValue("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", forKey: "tessedit_char_whitelist")
        tess.image = UIImage(named: "numbers09")
        //tess.image = UIImage(named: "red-numbers")
        tess.recognize()
        
        println(tess.recognizedText)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: TesseractDelegate {
    
}
