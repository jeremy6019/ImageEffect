//
//  ViewController.swift
//  ImageEffect
//
//  Created by 503 on 2020/02/25.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    //배열선언
    var imgArray:Array = Array<UIImage>()
    var imgURL = [
            "img1.jpg",
            "img2.jpg",
            "img3.jpg",
            "img4.jpg",
            "img5.jpg",
            "img6.jpg",
            "img7.jpg"
    ]
    
    var big:UIImageView!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            //배열의 요소추가
            for name in imgURL{
               imgArray.append(
                UIImage(named: name)!)
            }
            
            createImage()
        }
        //이미지 생성.
        func createImage(){
            
            for i in 0..<imgArray.count{
                let imgView =
                    UIImageView(image:imgArray[i])
                
                //크기 지정
                imgView.frame = CGRect(x: 100+(i*82), y: 100, width: 80, height: 80)
                
                self.view.addSubview(imgView)
                
                //썸네알에 동적 이밴트 부여
                let gesture =
                    UITapGestureRecognizer(
                    target:self, action: #selector(viewClick))
                imgView.addGestureRecognizer(gesture)
                imgView.isUserInteractionEnabled = true
            }
            //큰이미지뷰 생성
            big = UIImageView(image:imgArray[0])
            big.frame = CGRect(x: 200, y: 200, width: 200, height: 170)
            self.view.addSubview(big)
        }
      
    @objc func viewClick(sender:UITapGestureRecognizer){
        var photo = sender.view as! UIImageView
        big.image = photo.image
    }

    
}

