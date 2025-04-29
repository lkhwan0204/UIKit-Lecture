//
//  ViewController.swift
//  UIKitDay01Ex02
//
//  Created by kyuhyeon Lee on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imageOn: UIImage?
    var imageOff: UIImage?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // #imageLiteral( --> 산모양 이모콘 더블클릭
        imageOn = #imageLiteral(resourceName: "lamp_on")
        imageOff = #imageLiteral(resourceName: "lamp_off")
        
        imgView.image = imageOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        var w: CGFloat = 0
        var h: CGFloat = 0
        let scale: CGFloat = 1.6
        
        if isZoom {
            print("축소 됩니다.")
            btnZoom.setTitle("확대", for: .normal)
            //처리 후 isZoom 상태 변경
            //isZoom = false
            
            let w = imgView.frame.size.width / scale
            let h = imgView.frame.height / scale
            imgView.frame.size = CGSize(width: 300, height: 300)
        } else {
            print("확대됩니다.")
            btnZoom.setTitle("축소", for: .normal)
            //iszZoom = false
            
            // 확대 시키기
            //현재 이미지의 사이즈에 2배
            let w = imgView.frame.size.width * scale
            let h = imgView.frame.height * scale
            imgView.frame.size = CGSize(width: 300, height: 300)
        }
        isZoom = !isZoom
    }
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imageOn ?? imageOff
        } else {
            imgView.image = imageOff ?? imageOn
        }
    }
    
}

