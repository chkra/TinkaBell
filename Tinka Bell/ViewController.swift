//
//  ViewController.swift
//  Tinka Bell
//
//  Created by Christina Kratsch on 22.11.20.
//

import UIKit
import AVFoundation


let soundFilenames = ["audio1",
                      "audio2",
                      "audio3"]

var audioPlayerArray = [AVAudioPlayer]()



class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sound in soundFilenames {
          do {
               let url = URL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "mp3")!)
               let audioPlayer = try AVAudioPlayer(contentsOf: url)
               audioPlayerArray.append(audioPlayer)
          } catch {
               print(error)
               audioPlayerArray.append(AVAudioPlayer())
          }
        }
    }

    @IBAction func animalButton1Pressed(_ sender: Any) {
        print("Brumm brumm!")
        audioPlayer.stop()
        audioPlayer = audioPlayerArray[0]
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
    @IBAction func animalButton2Pressed(_ sender: Any) {
        print("Mümmel mümmel!")
        audioPlayer.stop()
        audioPlayer = audioPlayerArray[1]
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
    @IBAction func animalButton3Pressed(_ sender: Any) {
        print("Wuff wuff!")
        audioPlayer.stop()
        audioPlayer = audioPlayerArray[2]
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
    @IBAction func stopAllButtonPressed(_ sender: Any) {
        for player in audioPlayerArray {
            player.stop()
            player.currentTime = 0
        }
    }
}

