//
//  ViewController.swift
//  People
//
//  Created by Fawzi Rifai on 16/04/2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().reference().child("james").child("children").observe(.value) { snapshot in
            print("number of james children = \(snapshot.childrenCount)") // observe and print james children count
        }
        Database.database().reference().child("james").child("children").queryOrdered(byChild: "name").queryEqual(toValue: "child2").getData { error, snapshot in
            if snapshot.exists() {  // search for james child named child2
                print("found")
            } else {
                print("not found")
            }
        }
    }


}

