//
//  ViewController.swift
//  MPVolumeView
//
//  Created by home on 2018/03/15.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    // 参照保持用にスライダーを宣言
    var volumeSlider: UISlider!

    @IBOutlet weak var btnSound: UIButton!
    
    @IBAction func pushSound(_ sender: Any) {
        btnSound.isSelected = !btnSound.isSelected
        changeSound()
    }
    
    func changeSound() {
        // ミュート(音量のON/OFF)処理
        func changeSound() {
            if btnSound.isSelected {
                self.volumeSlider.setValue(1.0, animated: false)
                btnSound.setImage(UIImage(named: "btnSoundOn"), for: UIControlState())
            } else {
                self.volumeSlider.setValue(0.0, animated: false)
                btnSound.setImage(UIImage(named: "btnSoundOff"), for: UIControlState())
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 音量調整のため、システム音量設定画面をaddview
        
        self.view.backgroundColor = UIColor.white
        let mpVolumeView = MPVolumeView(frame: self.view.bounds)
        mpVolumeView.isHidden = true;
        self.view.addSubview(mpVolumeView)
        
        // 音量調整用のスライダーを取得
        for childView in mpVolumeView.subviews {
            // UISliderクラスで探索
            if childView is UISlider {
                print("一致")
                self.volumeSlider = childView as! UISlider
            }
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
