//
//  VideoView.swift
//  Knotive
//
//  Created by Muhammad Riaz on 14/01/2021.
//

import UIKit
import AVKit;
import AVFoundation;

class VideoView: UIView {
    
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self;
    }

    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
}
