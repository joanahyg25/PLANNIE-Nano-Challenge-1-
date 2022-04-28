//
//  ViewController.swift
//  PLANNIE (Nano Challenge 1)
//
//  Created by Joana Handoyo on 27/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
    performSegue(withIdentifier: "homeToAddTask", sender: self)
    }
    
}

