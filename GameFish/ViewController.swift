//
//  ViewController.swift
//  GameFish
//
//  Created by Nguyen Cong Toan on 4/12/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var gamemanager: GameManager?
    
    @IBAction func btn_Reset(_ sender: Any) {
        self.gamemanager?.fishViews?.removeAllObjects()
        for object in self.view.subviews
        {
            if (object.isKind(of: FishView.self))
            {
                object.removeFromSuperview()
            }
        }
        self.gamemanager?.addFishToViewController(viewcontroller: self, width: Int(self.view.bounds.width))
        
    }
    
    
    @IBOutlet weak var lbl_Point: UILabel!
    
    @IBAction func btn_Addfish(_ sender: Any) {
        self.gamemanager?.addFishToViewController(viewcontroller: self, width: Int(self.view.bounds.width))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let fishView = FishView(frame: CGRect(x: 0,y: 0,width: 40,height: 30))
       // fishView.generateFish(width: Int(self.view.bounds.width))
       // self.view.addSubview(fishView)
        
        self.gamemanager = GameManager()
        self.view.addSubview((self.gamemanager?.hookView)!)
        self.gamemanager?.addFishToViewController(viewcontroller: self, width: Int(self.view.bounds.width))
        point()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapHandle)))
        Timer.scheduledTimer(timeInterval: 0.025, target: self.gamemanager!, selector: Selector(("updateMove")), userInfo: nil, repeats: true)
    }
    
    func tapHandle(sender: UIGestureRecognizer)
    {
        let tapPoint = sender.location(in: self.view)
        self.gamemanager?.dropHookAtx(Int(tapPoint.x))
    }
    func point()
    {
        var fishview: FishView?
        var point = 0
        while((fishview) != nil){
        if (fishview?.status == fishview?.CAUGHT)
        {
        
            point = point + 1
            lbl_Point.text = String(point)
        }
   
        }

}
}
