//
//  UIViewControllerExtensionsForHUD.swift
//  Pintuan
//
//  Created by zhouyi on 27/09/2017.
//  Copyright © 2017 jwsszle, Inc. All rights reserved.
//

import UIKit

public extension UIViewController {
    func showHUDProcess(){
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 72))
        container.center = CGPoint(x: self.view.width/2, y: self.view.height/2)
        container.tag = 9526
        container.setCornerRadius(radius: 5)
        container.backgroundColor = UIColor.white
        self.view.addSubview(container)
        
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.center = CGPoint(x: container.width/2, y: container.height/2)
        indicator.startAnimating()
        container.addSubview(indicator)
        
        self.view.bringSubviewToFront(container)
    }
    
    func hiddenHUDProcess(){
        var containerView: UIView?
        self.view.subviews.forEach { (view) in
            if view.tag == 9526 {
                containerView = view
                return
            }
        }
        containerView?.removeFromSuperview()
    }
    
    
    
    func showHUD(){
        let container = UIView(frame: self.view.bounds)
        container.tag = 9527
        container.backgroundColor = UIColor.white
         self.view.addSubview(container)
        
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.center = CGPoint(x: container.width/2, y: container.height/2)
        indicator.startAnimating()
        container.addSubview(indicator)
        
        self.view.bringSubviewToFront(container)
    }
    
    func hiddeHUD(){
        var containerView: UIView?
        self.view.subviews.forEach { (view) in
            if view.tag == 9527 {
                containerView = view
                return
            }
        }
        containerView?.removeFromSuperview()
    }
    
    func showTip(_ content: String){
        showTip(content, shouldResponseTap: true)
    }
    
    func showTip(_ content: String, shouldResponseTap: Bool) {
        let container = UIView(frame: self.view.bounds)
        container.tag = 9528
        container.backgroundColor = UIColor.groupTableViewBackground
        self.view.addSubview(container)
        
        if shouldResponseTap {
            container.isUserInteractionEnabled = true
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tipContainerClicked))
            container.addGestureRecognizer(tap)
        }
        
        
        let tipLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 25))
        tipLabel.center = CGPoint(x: container.width/2, y: container.height/2)
        tipLabel.font = UIFont.systemFont(ofSize: 14)
        tipLabel.textColor = UIColor.titleColor
        tipLabel.textAlignment = .center
        tipLabel.text = content
        container.addSubview(tipLabel)
        
        self.view.bringSubviewToFront(container)
    }
    
    @objc func tipContainerClicked(){
        
    }
    
    func hiddeTip(){
        var containerView: UIView?
        self.view.subviews.forEach { (view) in
            if view.tag == 9528 {
                containerView = view
                return
            }
        }
        containerView?.isHidden = true
        containerView?.removeFromSuperview()
    }

    
    func delayHiddenHUD(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
            self.hiddeHUD()
        })
    }
}
