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
        collectionView?.register(TaskHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    //ordering task cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let taskCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TaskCell
        taskCell.nameLabel.text = "Sample Task \(indexPath.item)"
        return taskCell
    }
    //sizing of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    //
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
    }
    //dynamic sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        collectionVie
//        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
        return CGSize(width: view.frame.width, height: 100)
    }
}

//header component
class TaskHeader: BaseCell {
    
    let taskNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter task name: "
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupViews() {
        addSubview(taskNameTextField)
        //review once done
        addSubview(addTaskButton)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-[v1(80)]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":taskNameTextField, "v1":addTaskButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":taskNameTextField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v1]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1":addTaskButton]))
    }
}



//single task cell
class TaskCell: BaseCell{
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "testing"
        //study this
        label.translatesAutoresizingMaskIntoConstraints = false
        //understand UIFont
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        addSubview(nameLabel)
        //review once done
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    //why would this be needed?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}
