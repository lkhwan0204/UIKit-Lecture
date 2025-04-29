//
//  ViewController.swift
//  ImageViewer2
//
//  Created by kyuhyeon Lee on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    var img: UIImage?
    
    var num: Int? = 1
    
    @IBOutlet weak var imgView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = UIImage(named: "\(num!).png")
        imgView.image = img
    }

    
    @IBAction func prevBtn(_ sender: UIButton) {
        if num! > 1 {
            num? -= 1
        }
        img = UIImage(named: "\(num!).png")
        imgView.image = img
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        if num! < 5 {
            num? += 1
        }
        img = UIImage(named: "\(num!).png")
        imgView.image = img
    }
    
}
