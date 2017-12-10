//
//  MemeDetailViewController.swift
//  MemeMe_2
//
//  Created by Apple on 10/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var mememeData = [Meme]()
    var memeIndex = 0
    @IBOutlet weak var mememeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        mememeData = applicationDelegate.memes
        
        mememeImage.image = mememeData[memeIndex].memedImage
        
    }



}
