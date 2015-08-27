//
//  ViewController.swift
//  Surfcast
//
//  Created by Andreas Vestergaard on 27/08/15.
//  Copyright (c) 2015 Andreas Vestergaard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userCity: UITextField!
    
    @IBAction func findWeather(sender: AnyObject) {
    }

    @IBOutlet var resultLabel: UILabel!
    
    
    func ShowError() {
        
        resultLabel.text = "Not able to find weather for " + userCity.text + ". Please try again"

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = NSURL(string: "http://www.weather-forecast.com/locations/London/forecasts/latest")
        
        if url != nil {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
           
            var urlError = false
            
            if error == nil {
                
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println(urlContent)
                
                
            } else {
                
                urlError = true
                
            }
            
            if urlError == true {
                
                self.ShowError()
                
            }
            
        })
            
            task.resume()
    
        } else {
            
            ShowError()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

