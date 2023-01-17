//
//  File.swift
//  ColorPuzzleEyes WWDC 2022
//
//  Created by PUTRI RAHMADEWI on 17/04/22.
//

import UIKit
import AVFoundation

class GuideView: UIViewController{
    
    // Multimedia
    var soundURI: URL?
    var audioPlayer: AVAudioPlayer?
    
    //Image Tutor
    var tutorImage = ["Tutor1", "Tutor2", "Tutor3", "Tutor4"]
    var currentTutorIndex = 0
    
    
    var imagePlay: UIImageView = {
        let play = UIImageView()
        play.frame.origin = CGPoint(x: 0, y: 30)
        play.frame.size = CGSize(width: 90, height: 90)
        play.image = UIImage(named: "start")
        play.contentMode = .scaleAspectFill
        
        return play
    }()
    
    var imageTutor: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.frame.size = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = view
        view.backgroundColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
        
        let img = UIImage(named: tutorImage[0])
        imageTutor = UIImageView(frame: CGRect(x: 0, y: 0, width: 834, height: 1194))
        imageTutor.image = img
        view.addSubview(imageTutor)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(GuideView.nextImage(gesture:)))
        imageTutor.addGestureRecognizer(tap)
        imageTutor.isUserInteractionEnabled = true
        imageTutor.center = view.center
        imagePlay.center = view.center
        imagePlay.frame.origin.y += 350
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func nextImage(gesture : UIPinchGestureRecognizer){
        currentTutorIndex += 1
        if currentTutorIndex < tutorImage.count{
            playTouchSound()
            imageTutor.image = UIImage(named: tutorImage[currentTutorIndex])
        }else{
            playTouchSound()
            let next = PlayView()
            navigationController?.pushViewController(next, animated: true)
        }
    }
    
    //Function Play Sound
    public func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    public func playTouchSound(){
        self.playSound(file: "Touch Sound2", fileExtension: "mp3")
    }
    
    public func playSoundStart(){
        self.playSound(file: "Sound Start", fileExtension: "wav")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
