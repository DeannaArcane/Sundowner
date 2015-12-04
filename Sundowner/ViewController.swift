//
//  ViewController.swift
//  Sundowner
//
//  Created by Deanna Simpson on 2015-12-03.
//  Copyright © 2015 IWIT Hackathon 2015. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var drinkPic: UIImageView!
    @IBOutlet var drinkTitle: UILabel!
    var drinkSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("garcon", ofType: "aiff")!)
    var audioPlayer = AVAudioPlayer()

    @IBAction func getDrink(sender: AnyObject) {
        //Generate new drink
        var drinkList: [String] = ["Beer","Wine","Cocktail", "You're drunk, go home!"]
                //Update drinkTitle with new drink
        drinkTitle.text = drinkList[(Int)(arc4random_uniform((UInt32)(drinkList.count)))]
        
        //Update photo with new drink
        let currentText:String = drinkTitle.text!
        switch currentText {
            case "Beer":
            drinkPic.image = UIImage(named: "beer.jpeg")
            case "Wine":
            drinkPic.image = UIImage(named: "wine.jpeg")
        
            case "Cocktail":
            drinkPic.image = UIImage(named: "cocktail.jpeg")
        
            case "You're drunk, go home!":
            drinkPic.image = UIImage(named: "drunk.jpeg")
            
            default:
            drinkPic.image = UIImage(named: "Flaming_Cocktails.jpeg")
        }
        
        //Play sound
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: drinkSound)
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        sleep(2)
        
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

