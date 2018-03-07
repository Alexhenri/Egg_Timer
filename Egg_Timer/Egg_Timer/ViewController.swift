//
//  ViewController.swift
//  Egg_Timer
//
//  Created by Alexandre Henrique Silva on 07/03/18.
//  Copyright © 2018 Alexhenri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // variables
    var timer = Timer()
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var minusButton: UIBarButtonItem!
    
    //functions
    @objc func passerTimer(){
        if let counterString = counterLabel.text {
            if var counterNumber = Int(counterString){
                if counterNumber > 0 {
                    counterNumber     = counterNumber - 1
                    counterLabel.text = String(counterNumber)
                } else {
                    minusButton.isEnabled = false
                }
            } else {
                print("Error \(#line)")
            }
            
        } else {
            print("Error \(#line)")
        }
    }
    
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        if let counterString = counterLabel.text {
            if var counterNumber = Int(counterString){
                counterNumber           = counterNumber + 10
                counterLabel.text       = String(counterNumber)
                minusButton.isEnabled   = true
            } else {
                print("Error \(#line)")
            }
            
        } else {
            print("Error \(#line)")
        }
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
            if let counterString = counterLabel.text {
                if var counterNumber = Int(counterString){
                    if counterNumber <= 10 {
                        counterLabel.text       = String(0)
                        minusButton.isEnabled   = false
                    } else {
                        counterNumber     = counterNumber - 10
                        counterLabel.text = String(counterNumber)
                    }
                } else {
                    print("Error \(#line)")
                }
                
            } else {
                print("Error \(#line)")
            }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        counterLabel.text       = String(210)
        minusButton.isEnabled   = true
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        playButton.isEnabled  = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(passerTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        pauseButton.isEnabled = false
        playButton.isEnabled  = true
        timer.invalidate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(passerTimer), userInfo: nil, repeats: true)
        playButton.isEnabled = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

