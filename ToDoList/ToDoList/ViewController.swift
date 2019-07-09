//
//  ViewController.swift
//  ToDoList
//
//  Created by Eric Blancas on 7/7/19.
//  Copyright © 2019 Eric Blancas. All rights reserved.
//

import UIKit
//understand the UIcollection calls here
class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        navigationItem.title = "To-do list"
        collectionView?.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView?.register(TaskCell.self, forCellWithReuseIdentifier: "cellId")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

}

class TaskCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    //why would this be needed?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "testing"
        //study this
        label.translatesAutoresizingMaskIntoConstraints = false
        //understand UIFont
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        //review once done
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    }
}

