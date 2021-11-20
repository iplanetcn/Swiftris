//
//  GameTimer.swift
//  Swiftris
//
//  Created by John
//  Copyright (c) 2021 CherryStudios. All rights reserved.
//

import UIKit

class GameTimer: NSObject {
    
    var counter = 0
    fileprivate var displayLink:CADisplayLink!
    
    init(target:AnyObject, selector:Selector) {
        self.displayLink = CADisplayLink(target: target, selector: selector)
        self.displayLink.preferredFramesPerSecond = 30
        self.displayLink.isPaused = true
        self.displayLink.add(to: RunLoop.current, forMode: RunLoop.Mode.default)
    }
    
    func start() {
        self.displayLink.isPaused = false
    }
    func pause() {
        self.displayLink.isPaused = true
    }
    deinit {
        print("deinit GameTimer")
        
        if let link = self.displayLink {
            link.remove(from: RunLoop.current, forMode: RunLoop.Mode.default)
        }
    }
    
}
