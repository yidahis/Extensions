//
//  Int+Extension.swift
//  PassVPN
//
//  Created by Asteroid on 2018/1/2.
//  Copyright © 2018年 Asteroid. All rights reserved.
//

import Foundation

public extension Int {
    func timeformat() -> String {
        //format of hour
        let hour = String(format: "%02d", self/3600)
        
        //format of minute
        let minite = String(format: "%02d", (self%3600)/60)
        
        //format of second
        let second = String(format: "%02d", self%60)
        
        //format of time
        
        let time = String(format: "%@:%@:%@", hour, minite, second)
        
        return time;
        
    }
}
