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
    
    @IBOutlet weak var videoSilder: UISlider!
    @IBOutlet weak var videoCurrentTimeLabel: UILabel!
    @IBOutlet weak var videoLengthLabel: UILabel!
    
    @IBOutlet weak var silentsound: UIButton!
    @IBOutlet weak var pausplaybutton: UIButton!
    
    var isPlaying = false
    var isSilent  = false
    
    
  //  var playerItem : AVPlayerItem!
    var player : AVPlayer?
    var seconds:Float64?

    @IBOutlet weak var search_Text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    @IBAction func silentSound(_ sender: Any) {
        if isSilent{
        player?.volume = 0
        silentsound.setImage(UIImage(named: "volume_off"), for: .normal)
        }else{
        player?.volume = 1
        silentsound.setImage(UIImage(named: "volume_up"), for: .normal)
        }
        isSilent = !isSilent
    }
    
    @IBAction func btn_Search(_ sender: Any) {
        //search_Text.text = "https://s3-ap-northeast-1.amazonaws.com/mid-exam/Video/taeyeon.mp4"
        if search_Text.text == "" {
            print("enter url")
        }else{
              //setupPlayer(urlStirng: search_Text.text!)
            setupPlayer(urlString: search_Text.text!)
           
            }
        }
  

    @IBAction func fastForward(_ sender: Any) {
        
       
      
       
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
    func setupPlayer(urlString:String) {
            if let url = URL(string: urlString){
                print(url )
                player = AVPlayer(url: url)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = self.view.bounds
                self.view.layer.addSublayer(playerLayer)
                player?.play()
               
               
                    if let duration = player?.currentItem?.asset.duration {
                        var seconds = CMTimeGetSeconds(duration)
                        let secondsText = Int(seconds) % 60
                        let minutesText = String(format: "%02d", Int(seconds)/60)
                        videoLengthLabel.text = "\(minutesText):\(secondsText)"
                
                // track player progress
                
                let interval = CMTime(value: 1, timescale: 2)
                       
                        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
                           seconds = CMTimeGetSeconds(progressTime)
                            let secondsString = String(format: "%02d", Int(seconds) % 60)
                            let minutesString = String(format: "%02d", Int(seconds) / 60 )
                            self.videoCurrentTimeLabel.text = "\(minutesString):\(secondsString)"
                            
                // move the slider thumb
                            if let duration = self.player?.currentItem?.asset.duration{
                               let durationSeconds = CMTimeGetSeconds(duration)
                                self.videoSilder.value = Float(seconds/durationSeconds)
                            }
                        })
                        
                    }
                }
        }
    
    

    @IBAction func fullScreen(_ sender: Any) {
        
        
        
    
    }
  
            
        }

    
        





