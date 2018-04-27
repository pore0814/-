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
    
    @IBOutlet weak var pausplaybutton: UIButton!
    var isPlaying = false
    
  //  var playerItem : AVPlayerItem!
    var player : AVPlayer?

    @IBOutlet weak var search_Text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        }
       
 
    @IBAction func btn_Search(_ sender: Any) {
        
        search_Text.text = "https://s3-ap-northeast-1.amazonaws.com/mid-exam/Video/taeyeon.mp4"
        if search_Text.text == "" {
            print("enter url")
        }else{
              //setupPlayer(urlStirng: search_Text.text!)
            setupPlayer()
            }
        }
  

    
    @IBAction func pausePlayButton(_ sender: Any) {
        if isPlaying{
            print("isplay",isPlaying)
            player?.pause()
            pausplaybutton.setImage(UIImage(named: "stop"), for: .normal)
        }else{
            player?.play()
            pausplaybutton.setImage(UIImage(named: "play_button"), for:.normal)
        }
        isPlaying = !isPlaying
    }
        
        
       // func setupPlayer(urlStirng: String) {
           func setupPlayer() {
            if let url = URL(string: "https://s3-ap-northeast-1.amazonaws.com/mid-exam/Video/taeyeon.mp4"){
                print(url )
                player = AVPlayer(url: url)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = self.view.bounds
                self.view.layer.addSublayer(playerLayer)
                player?.play()
            
        }
        
        }
    
  
    
        

    }



