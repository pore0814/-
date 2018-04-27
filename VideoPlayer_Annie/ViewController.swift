//
//  ViewController.swift
//  VideoPlayer_Annie
//
//  Created by 王安妮 on 2018/4/27.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var playerItem : AVPlayerItem!
    var videoPlayer : AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        }
       
 
    @IBAction func btn_Search(_ sender: Any) {
        
                let url = "https://s3-ap-northeast-1.amazonaws.com/mid-exam/Video/taeyeon.mp4"
                if let url = URL(string: url){
                    print(url)
                    let player = AVPlayer(url: url)
                    let playerLayer = AVPlayerLayer(player: player)
                    playerLayer.frame = self.view.bounds
                    self.view.layer.addSublayer(playerLayer)
                    player.play()
        
        }
        
    }
    
func Search(_ sender: Any) {
    
  print("aaaa")
    
//
//        let url = "https://s3-ap-northeast-1.amazonaws.com/mid-exam/Video/taeyeon.mp4"
//        if let url = URL(string: url){
//            print(url)
//            let player = AVPlayer(url: url)
//            let playerLayer = AVPlayerLayer(player: player)
//            playerLayer.frame = self.view.bounds
//            self.view.layer.addSublayer(playerLayer)
//            player.play()
//
//
    
        

    }
    
}

