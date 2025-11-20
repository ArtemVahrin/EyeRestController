//
//  Timer.swift
//  EyeRestController
//
//  Created by Артём on 18.11.2025.
//

import Foundation
import Combine

struct MyTimer {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func timeToMinutes(from sec: Int) -> String {
        var sec = sec
        let min = sec / 60
        sec -= min * 60
        
        return sec < 10 ? "\(min):0\(sec)" : "\(min):\(sec)"
    }
}
