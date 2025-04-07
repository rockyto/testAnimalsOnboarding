//
//  ViewController.swift
//  testAnimalsOnboarding
//
//  Created by Rodrigo Sánchez on 04/04/25.
//

import UIKit
import AVFoundation


struct Pasos{
    var index = 0
    var elAudioFile = ""
    var backIntro: UIImage?
}

class ViewController: UIViewController {
    @IBOutlet weak var fondoIntro: UIImageView!
    @IBOutlet weak var control: UIPageControl!
    var pasos : Pasos!
    var player: AVAudioPlayer?
    
    var selectSound: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fondoIntro.image = pasos.backIntro
        control.numberOfPages = 6 
        control.currentPage = pasos.index
        selectSound = pasos.elAudioFile
        
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: selectSound, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print("Error reproduciendo sonido: \(error.localizedDescription)")
        }
    }
    
    @IBAction func playAnimalSound(_ sender: Any) {
        if player?.isPlaying == true {
            player?.stop()
        }else{
            self.playSound()
        }
        
        
    }
    
}

