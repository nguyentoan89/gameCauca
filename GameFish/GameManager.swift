
//
//  GameManager.swift
//  GameFish
//
//  Created by Nguyen Cong Toan on 4/12/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit
class GameManager: NSObject {
    var fishViews: NSMutableArray? // luu so luong ca
    var hookView: HookerView?
    
    override init()
    {
        self.fishViews = NSMutableArray()
        self.hookView = HookerView(frame: CGRect(x: 0, y: -490, width: 20, height: 490))
    }
    
    func addFishToViewController(viewcontroller: UIViewController, width: Int)
    {
        let fishView = FishView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        fishView.generateFish(width: width)
        self.fishViews?.add(fishView)
        viewcontroller.view.addSubview(fishView)
    }
    
    
    func bite(fishView: FishView)
    {
        if (fishView.status != fishView.CAUGHT && self.hookView?.status != self.hookView?.DRAWINGUP)
        {
            fishView.caught()
            fishView.center = CGPoint(x: self.hookView!.center.x, y: self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)
            self.hookView?.status = self.hookView?.CAUGHTF
        }
    }
    
    func updateMove()
    {
        self.hookView?.updateMove()
        for fishView in self.fishViews!
        {
            (fishView as AnyObject).updateMove()
            if ((fishView as AnyObject).frame.contains(CGPoint(x: (self.hookView?.center.x)!, y: (self.hookView?.frame.origin.y)! + (self.hookView?.bounds.height)! + (fishView as AnyObject).frame.width/2)))
            {
                self.bite(fishView: fishView as! FishView)
            }
        }
    }
    
    func dropHookAtx(_ n: Int)
    {
        self.hookView?.dropdownAtx(x: n)
    }
    
            
        
        
        
        
        
        
    }

