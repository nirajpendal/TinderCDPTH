//
//  ViewController.swift
//  TinderCDPTH
//
//  Created by Niraj Pendal on 4/26/17.
//  Copyright © 2017 Niraj. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet var draggleImageView: DraggableImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dc = storyBoard.instantiateViewController(withIdentifier: "profileView") as! ProfileViewController
        dc.profileImage = draggleImageView.imageView.image
        present(dc, animated: true, completion: nil)
    }
    
}

