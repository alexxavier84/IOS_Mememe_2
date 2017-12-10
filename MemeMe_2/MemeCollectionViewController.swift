//
//  MemeCollectionViewController.swift
//  MemeMe_2
//
//  Created by Apple on 05/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var mememeData = [Meme]()
    var memeIndex = 0
    
    @IBOutlet var mememeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mememeCollectionView.dataSource = self
        mememeCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mememeCollectionView.reloadData()
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        mememeData = applicationDelegate.memes
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mememeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath) as! MemeCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let memeCell = cell as! MemeCollectionViewCell
        memeCell.memeCellImage.image = mememeData[indexPath.row].memedImage
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        memeIndex = indexPath.row
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue"{
            let detailView = segue.destination as! MemeDetailViewController
            detailView.memeIndex = self.memeIndex
        }
    }
    
}
