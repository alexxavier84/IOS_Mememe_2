//
//  MemeTableViewController.swift
//  MemeMe_2
//
//  Created by Apple on 05/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    var mememeData = [Meme]()
    
    @IBOutlet var mememeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mememeTableView.dataSource = self
        //mememeTableView.delegate = self
        
        //print("Alex Show")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mememeTableView.reloadData()
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        mememeData = applicationDelegate.memes
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mememeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MememeDataCell")
        cell?.textLabel?.text = "\(self.mememeData[indexPath.row].topText) \(self.mememeData[indexPath.row].bottomText)"
        cell?.imageView?.image = self.mememeData[indexPath.row].memedImage
        
        return cell!
    }
    
    
    
    
    
    
}
