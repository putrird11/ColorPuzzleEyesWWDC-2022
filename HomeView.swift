//
//  File.swift
//  ColorPuzzleEyes WWDC 2022
//
//  Created by PUTRI RAHMADEWI on 17/04/22.
//

import UIKit
import AVFoundation

class HomeView: UIViewController{
    
    // Multimedia
    var soundURI: URL?
    var audioPlayer: AVAudioPlayer?
    
    var labeLWelcome: UILabel = {
        let welcome = UILabel()
        welcome.frame.origin = CGPoint(x: 0, y: 0)
        welcome.frame.size = CGSize(width: 550, height: 300)
        welcome.text = "Welcome"
        welcome.font = UIFont(name: "Arial Rounded MT Bold", size: 100)
        welcome.layer.shadowColor = UIColor.black.cgColor
        welcome.layer.shadowOffset = CGSize(width: 4, height: 4)
        welcome.layer.shadowOpacity = 1.0
        
        return welcome
    }()
    
    var buttonNext: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 189, height: 190)
        button.setImage(UIImage(named: "start First"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    var imageIcon: UIImageView = {
        let icon = UIImageView()
        icon.frame.origin = CGPoint(x: 0, y: 0)
        icon.frame.size = CGSize(width: 170, height: 180)
        icon.image = UIImage(named: "icon")
        icon.contentMode = .scaleAspectFill
        
        return icon
    }()
    
    var labelNameApp: UILabel = {
        let nameApp = UILabel()
        nameApp.frame.origin = CGPoint(x: 0, y: 0)
        nameApp.frame.size = CGSize(width: 800, height: 300)
        nameApp.text = "Color Puzzle for Eyes"
        nameApp.font = UIFont(name: "Arial Rounded MT Bold", size: 60)
        nameApp.layer.shadowColor = UIColor.black.cgColor
        nameApp.layer.shadowOffset = CGSize(width: 2, height: 2)
        nameApp.layer.shadowRadius = 4
        nameApp.layer.shadowOpacity = 0.6
        
        return nameApp
    }()
    
    
    var backgroundMainPreview: UIImageView = {
        let mainBg = UIImageView()
        mainBg.frame.origin = CGPoint(x: 0, y: 0)
        mainBg.frame.size = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        mainBg.image = UIImage(named: "mainBakground")
        mainBg.contentMode = .scaleAspectFill
        
        return mainBg
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        playBackSound()
        
        //MARK: MainBackground
        backgroundMainPreview.center = view.center
        view.addSubview(backgroundMainPreview)
        
        //MARK: Label Title
        labeLWelcome.center = view.center
        labeLWelcome.frame.origin.y -= 25
        labeLWelcome.textAlignment = .center
        view.addSubview(labeLWelcome)
        
        //MARK: Image Eyes
        imageIcon.center = view.center
        imageIcon.frame.origin.y -= 220
        view.addSubview(imageIcon)
        
        //MARK: Label Description
        labelNameApp.center = view.center
        labelNameApp.frame.origin.y += 80
        labelNameApp.textAlignment = .center
        view.addSubview(labelNameApp)
        
        //MARK: Button Next
        buttonNext.center = view.center
        buttonNext.frame.origin.y += 250
        view.addSubview(buttonNext)
        buttonNext.addTarget(self, action: #selector(actionGoToGuideView(_:)), for: .touchUpInside)
        
    }
    
    // Navigation Controller
    @objc func actionGoToGuideView(_ sender: UIButton){
        //finally, we can push secondviewcontroller
        playTouchSound()
        navigationController?.pushViewController(GuideView(), animated: true)
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
    
    public func playBackSound(){
        self.playSound(file: "Sound Puzzle", fileExtension: "mp3")
    }
    
    public func playTouchSound(){
        self.playSound(file: "Touch Sound2", fileExtension: "mp3")
    }
    
    //Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
