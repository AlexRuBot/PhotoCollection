//
//  MainCollectionViewController.swift
//  PhotoCollection
//
//  Created by Саша Гужавин on 05.08.2021.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    let itemsPetRow: CGFloat = 2
    let secondInsert = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoSegue" {
            let deteilVC = segue.destination as! DeteilViewController
            let cell = sender as! PhotoCollectionViewCell
            deteilVC.image = cell.imageCellOutlet.image
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
    
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.imageCellOutlet.image = image
        
        return cell
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingWedth = secondInsert.left * (itemsPetRow + 1)
        let availableWedth = collectionView.frame.width - paddingWedth
        let wedthPetItem = availableWedth / itemsPetRow
        return CGSize(width: wedthPetItem, height: wedthPetItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return secondInsert
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return secondInsert.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return secondInsert.left
    }
}


