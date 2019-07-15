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
    var tasks = ["Walk Dog", "Wash Dishes", "Take out trash"]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    //ordering task cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let taskCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TaskCell
        taskCell.nameLabel.text = tasks[indexPath.item]
        return taskCell
    }
    //sizing of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    //
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! TaskHeader
        header.viewController = self
        return header
    }
    //dynamic sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        collectionVie
//        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
        return CGSize(width: view.frame.width, height: 100)
    }
    func addNewTask(taskName: String) {
        tasks.append(taskName)
        collectionView?.reloadData()
    }
}

//header component
class TaskHeader: BaseCell {
    
    var viewController: ViewController?
    
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
        addTaskButton.addTarget(self, action:#selector(addTask), for: .touchUpInside)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[v0]-[v1(80)]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":taskNameTextField, "v1":addTaskButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-35-[v0]-35-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":taskNameTextField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[v0]-100-|", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: ["v0":addTaskButton]))
    }
    
    @objc func addTask() {
        viewController?.addNewTask(taskName: taskNameTextField.text!)
        taskNameTextField.text = ""
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
