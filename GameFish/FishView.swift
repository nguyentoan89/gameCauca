
//
//  FishView.swift
//  GameFish
//
//  Created by Nguyen Cong Toan on 4/12/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit
class FishView: UIImageView {
    var status: Int? // luu trang thai cua con ca
    var speed: Int? // luu toc do cua con ca
    var vy: Int? // luu lai trang thai boi cua con ca
    var widthFrame: Int?
    var heightFrame: Int?
    var widthFish: Int?
    var heightFish: Int?
    let MOVING: Int = 0
    let CAUGHT: Int = 1
    
    override init(frame: CGRect)
    {
        self.widthFish = Int(frame.width)
        self.heightFish = Int(frame.height)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Khoi tao con ca
    
    func generateFish(width: Int)
    {
        //self.image = UIImage(named: "fish1.png")
        //self.frame = CGRect(x: CGFloat(100),y: CGFloat(100), width: CGFloat(40), height: CGFloat(30))
        
        self.widthFrame = width
        self.vy = Int(arc4random_uniform(3)) - 1  // random trang thai boi cua con ca
        let y: Float = Float(arc4random_uniform(240)) + 80 // random vi tri con ca xuat hien tren man hinh 80 - 240
        self.status = MOVING
        self.speed = Int(arc4random_uniform(2)) + 1
        if (Int(self.center.x) <= -Int(self.widthFish!/2))
        {
            self.transform = CGAffineTransform.identity
            self.image = UIImage(named: "fishroll.png")
            //self.image = UIImage(named: "dory.png")
            self.frame = CGRect(x: -CGFloat(self.widthFish!),y: CGFloat(y),width: CGFloat(self.widthFish!),height: CGFloat(self.heightFish!))
        }
        else {
            self.transform = CGAffineTransform.identity
            self.image = UIImage(cgImage: UIImage(named: "fishroll.png")!.cgImage!, scale: 1.0, orientation: UIImageOrientation.upMirrored)
            //self.image = UIImage(cgImage: UIImage(named: "dory.png")!.cgImage!, scale: 1.0, orientation: UIImageOrientation.upMirrored)
            self.frame = CGRect(x: CGFloat(self.widthFrame! + self.widthFish!/2),y: CGFloat(y),width: CGFloat(self.widthFish!),height: CGFloat(self.heightFish!))
            self.speed = -Int(self.speed!)
        }
    }
    
    func updateMove()
    {
        if (self.status == MOVING)
        {
            self.center = CGPoint(x: self.center.x + CGFloat(self.speed!), y: self.center.y + CGFloat(self.vy!))
            if (Int(self.center.y) < -self.heightFish! || Int(self.center.y) < self.heightFish! )
            {
                self.vy = -self.vy!
            }
            if ((Int(self.center.x) > self.widthFrame! && self.speed! > 0) || (Int(self.center.x) < -self.widthFish! && self.speed! < 0))
                {
                        generateFish(width: self.widthFrame!)
                }
            }
        else if (self.status == CAUGHT)
            {
                self.center = CGPoint(x: self.center.x, y: self.center.y - 5)
                if (Int(self.center.x) < self.widthFish!)
                {
                    generateFish(width: self.widthFrame!)
                }
            }
        }
    // khi con cai bi bat thi se quay con ca 1 goc M_PI_2 (90 do)
    func caught()
    {
        if (self.status == MOVING)
        {
            self.status = CAUGHT
            if (self.speed! > 0)
            {
                self.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
            }
            else
            {
                self.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
            }
        }
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

