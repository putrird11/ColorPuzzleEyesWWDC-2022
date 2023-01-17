//
//  File.swift
//  ColorPuzzleEyes WWDC 2022
//
//  Created by PUTRI RAHMADEWI on 18/04/22.
//

import UIKit
import AVFoundation



struct ShapePosition {
    var location: CGPoint
}

class PlayView: UIViewController{
    
    // Max playing time
    var seconds = 10
    var timer = Timer()
    
    // Multimedia
    var soundURI: URL?
    var audioPlayer: AVAudioPlayer?
    
    //MARK: Pop up
    var imageStart: UIImageView = {
        let start = UIImageView()
        start.frame.origin = CGPoint(x: 87, y: 197)
        start.frame.size = CGSize(width: 665, height: 766)
        start.image = UIImage(named: "StartView")
        start.contentMode = .scaleAspectFill
        
        return start
    }()
    
    var imageStart2: UIImageView = {
        let start = UIImageView()
        start.frame.origin = CGPoint(x: 87, y: 197)
        start.frame.size = CGSize(width: 665, height: 766)
        start.image = UIImage(named: "StartView2")
        start.contentMode = .scaleAspectFill
        
        return start
    }()
    
    var imageDiscalimer: UIImageView = {
        let end = UIImageView()
        end.frame.origin = CGPoint(x: 87, y: 31)
        end.frame.size = CGSize(width: 673, height: 1108)
        end.image = UIImage(named: "PopupDisclaimer")
        end.contentMode = .scaleAspectFill
        
        return end
    }()
    
    var imageYouWin: UIImageView = {
        let end = UIImageView()
        end.frame.origin = CGPoint(x: 87, y: 31)
        end.frame.size = CGSize(width: 673, height: 1108)
        end.image = UIImage(named: "PopupWin")
        end.contentMode = .scaleAspectFill
        
        return end
    }()
    
    var imageEndWWDC: UIImageView = {
        let end = UIImageView()
        end.frame.origin = CGPoint(x: 0, y: 0)
        end.frame.size = CGSize(width: 834, height: 1194)
        end.image = UIImage(named: "ViewEndWWDC")
        end.contentMode = .scaleAspectFill
        
        return end
    }()
    
    var imageTimesup: UIImageView = {
        let end = UIImageView()
        end.frame.origin = CGPoint(x: 105, y: 289)
        end.frame.size = CGSize(width: 626, height: 578)
        end.image = UIImage(named: "PopupTimesup")
        end.contentMode = .scaleAspectFill
        
        return end
    }()
    
    // MARK: Create Buttom
    var buttonRestart: UIButton = {
        let button = UIButton(frame: CGRect(x: 342.66, y: 805.91, width: 160.66, height: 160.66))
        button.setImage(UIImage(named: "btnRestart"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    var buttonArrowWWDC: UIButton = {
        let end = UIButton(frame: CGRect(x: 373.61, y: 932.22, width: 65, height: 69))
        end.setImage(UIImage(named: "arrowWWDC"), for: .normal)
        end.contentMode = .scaleAspectFill
        
        return end
    }()
    
    var buttonInfo: UIButton = {
        let button = UIButton(frame: CGRect(x: 186.9, y: 904.86, width: 135.19, height: 140.09))
        button.setImage(UIImage(named: "btnInfo"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    var buttonNext: UIButton = {
        let button = UIButton(frame: CGRect(x: 523.9, y: 909.76, width: 135.19, height: 135.19))
        button.setImage(UIImage(named: "btnNext"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    var buttonTimesup: UIButton = {
        let button = UIButton(frame: CGRect(x: 329, y: 613, width: 182, height: 182))
        button.setImage(UIImage(named: "btnTimesup"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    //MARK: Label Start & Timer
    var labelStart: UILabel = {
        let start = UILabel()
        start.frame.origin = CGPoint(x: 173, y: 701)
        start.frame.size = CGSize(width: 510, height: 207)
        start.text = "START"
        start.font = UIFont(name: "Arial Rounded MT Bold", size: 155)
        
        return start
    }()
    
    //MARK: Block Rectangle White
    var rectangleWhite1: UIImageView = {
        let rWhite1 = UIImageView()
        rWhite1.frame.size = CGSize(width: 134.61, height: 120.07)
        rWhite1.image = UIImage(named: "RectangleWhite1")
        rWhite1.contentMode = .scaleAspectFill
        rWhite1.accessibilityIdentifier = "rWhite1"
        
        return rWhite1
    }()
    
    var rectangleWhite2: UIImageView = {
        let rWhite2 = UIImageView()
        rWhite2.frame.size = CGSize(width: 134.61, height: 120.07)
        rWhite2.image = UIImage(named: "RectangleWhite2")
        rWhite2.contentMode = .scaleAspectFill
        rWhite2.accessibilityIdentifier = "rWhite2"
        
        return rWhite2
    }()
    
    var rectangleWhite3: UIImageView = {
        let rWhite3 = UIImageView()
        rWhite3.frame.size = CGSize(width: 134.61, height: 120.07)
        rWhite3.image = UIImage(named: "RectangleWhite3")
        rWhite3.contentMode = .scaleAspectFill
        rWhite3.accessibilityIdentifier = "rWhite3"
        
        return rWhite3
    }()
    
    var rectangleWhite4: UIImageView = {
        let rWhite4 = UIImageView()
        rWhite4.frame.size = CGSize(width: 134.61, height: 120.07)
        rWhite4.image = UIImage(named: "RectangleWhite4")
        rWhite4.contentMode = .scaleAspectFill
        rWhite4.accessibilityIdentifier = "rWhite4"
        
        return rWhite4
    }()
    
    var rectangleWhite5: UIImageView = {
        let rWhite5 = UIImageView()
        rWhite5.frame.size = CGSize(width: 134.61, height: 120.07)
        rWhite5.image = UIImage(named: "RectangleWhite5")
        rWhite5.contentMode = .scaleAspectFill
        rWhite5.accessibilityIdentifier = "rWhite5"
        
        return rWhite5
    }()
    
    // MARK: Navigation Hide
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: Block Rectangle Color
    var rectangle1: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 139, y: 747)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle1")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite2"
        
        return r1
    }()
    
    var rectangle2: UIImageView = {
        let r2 = UIImageView()
        r2.frame.origin = CGPoint(x: 279, y: 747)
        r2.frame.size = CGSize(width: 134.61, height: 120.07)
        r2.image = UIImage(named: "Rectangle2")
        r2.contentMode = .scaleAspectFill
        r2.isUserInteractionEnabled = true
        r2.accessibilityIdentifier = "rWhite1"
        
        return r2
    }()
    
    var rectangle3: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 419, y: 747)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle3")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite3"
        
        return r1
    }()
    
    var rectangle4: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 559, y: 747)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle4")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite2"
        
        return r1
    }()
    
    var rectangle5: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 139, y: 873)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle5")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite1"
        
        return r1
    }()
    
    var rectangle6: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 279, y: 873)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle6")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite3"
        
        return r1
    }()
    
    var rectangle7: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 419, y: 873)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle7")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite2"
        
        return r1
    }()
    
    var rectangle8: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 559, y: 873)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle8")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite4"
        
        return r1
    }()
    
    var rectangle9: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 139, y: 999)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle9")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite5"
        
        return r1
    }()
    
    var rectangle10: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 279, y: 999)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle10")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite4"
        
        return r1
    }()
    
    var rectangle11: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 419, y: 999)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle11")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite3"
        
        return r1
    }()
    
    var rectangle12: UIImageView = {
        let r1 = UIImageView()
        r1.frame.origin = CGPoint(x: 559, y: 999)
        r1.frame.size = CGSize(width: 134.61, height: 120.07)
        r1.image = UIImage(named: "Rectangle12")
        r1.contentMode = .scaleAspectFill
        r1.isUserInteractionEnabled = true
        r1.accessibilityIdentifier = "rWhite5"
        
        return r1
    }()
    
    // Icon
    var imageIcon: UIImageView = {
        let icon = UIImageView()
        icon.frame.origin = CGPoint(x: 0, y: 30)
        icon.frame.size = CGSize(width: 100, height: 100)
        icon.image = UIImage(named: "icon")
        icon.contentMode = .scaleAspectFill
        
        return icon
    }()
    
    // Image Answer
    var imageAnswer: UIImageView = {
        let answer = UIImageView()
        answer.frame.origin = CGPoint(x: 30, y: 370)
        answer.frame.size = CGSize(width: 289, height: 256)
        answer.image = UIImage(named: "Answer")
        answer.contentMode = .scaleAspectFill
        
        return answer
    }()
    
    var imageAnswer2: UIImageView = {
        let answer = UIImageView()
        answer.frame.origin = CGPoint(x: 132, y: 325)
        answer.frame.size = CGSize(width: 250, height: 256)
        answer.image = UIImage(named: "Answer2")
        answer.contentMode = .scaleAspectFill
        
        return answer
    }()
    
    // Icon Timer
    var imageTimer: UIImageView = {
        let timer = UIImageView()
        timer.frame.origin = CGPoint(x: 290, y: 94)
        timer.frame.size = CGSize(width: 120, height: 110)
        timer.image = UIImage(named: "Timer")
        timer.contentMode = .scaleAspectFill
        
        return timer
    }()
    
    // Position Drag & Drop Image
    var initialMovableViewPosition: CGPoint = .zero
    var beginningPosition: CGPoint = .zero
    var rectangleOriginPositionBeforeMove: CGPoint!
    var isRectWhiteOneFilled: Bool = false
    var isRectWhiteTwoFilled: Bool = false
    var isRectWhiteThreeFilled: Bool = false
    var isRectWhiteFourFilled: Bool = false
    var isRectWhiteFiveFilled: Bool = false
    
    
    var firstLevel: [ShapePosition]!
    var secondLevel: [ShapePosition]!
    var currentLevel: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Position Level
        if currentLevel == 1{
            view.addSubview(imageAnswer)
            firstLevel = [
                ShapePosition(location: CGPoint(x: 390.25, y: 436.69)),
                ShapePosition(location: CGPoint(x: 522.44, y: 320)),
                ShapePosition(location: CGPoint(x: 522.44, y: 436.69)),
                ShapePosition(location: CGPoint(x: 654, y: 436.69)),
                ShapePosition(location: CGPoint(x: 522.44, y: 554)),
            ]
            
            rectangleWhite1.frame.origin = firstLevel[0].location
            rectangleWhite2.frame.origin = firstLevel[1].location
            rectangleWhite3.frame.origin = firstLevel[2].location
            rectangleWhite4.frame.origin = firstLevel[3].location
            rectangleWhite5.frame.origin = firstLevel[4].location
        }
        
        if currentLevel == 2 {
            view.addSubview(imageAnswer2)
            secondLevel = [
                ShapePosition(location: CGPoint(x: 434.44, y: 369)),
                ShapePosition(location: CGPoint(x: 567.44, y: 368.69)),
                ShapePosition(location: CGPoint(x: 434.44, y: 486.69)),
                ShapePosition(location: CGPoint(x: 567, y: 486.69)),
                ShapePosition(location: CGPoint(x: 567, y: 250))
            ]
            
            rectangleWhite1.frame.origin = secondLevel[0].location
            rectangleWhite2.frame.origin = secondLevel[1].location
            rectangleWhite3.frame.origin = secondLevel[2].location
            rectangleWhite4.frame.origin = secondLevel[3].location
            rectangleWhite5.frame.origin = secondLevel[4].location
        }
        
        view.backgroundColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1.00)
        imageIcon.frame.origin.x = view.frame.width - 130
        imageIcon.frame.origin.x = view.frame.width - 130
        view.addSubview(imageIcon)
        view.addSubview(imageTimer)
        
        // Definision View Block Rectangle White
        view.addSubview(rectangleWhite1)
        view.addSubview(rectangleWhite2)
        view.addSubview(rectangleWhite3)
        view.addSubview(rectangleWhite4)
        view.addSubview(rectangleWhite5)
        
        // Definition View Block Rectangle Color
        view.addSubview(rectangle1)
        view.addSubview(rectangle2)
        view.addSubview(rectangle3)
        view.addSubview(rectangle4)
        view.addSubview(rectangle5)
        view.addSubview(rectangle6)
        view.addSubview(rectangle7)
        view.addSubview(rectangle8)
        view.addSubview(rectangle9)
        view.addSubview(rectangle10)
        view.addSubview(rectangle11)
        view.addSubview(rectangle12)
        
        //Level
        if currentLevel == 1 {
            playSoundStart()
            imageStart.center = view.center
            view.addSubview(imageStart)
        }else if currentLevel == 2 {
            playSoundStart()
            imageStart2.center = view.center
            view.addSubview(imageStart2)
        }
        
        
        
        // Gesture Recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PlayView.imageTapped(gesture:)))
        imageStart.addGestureRecognizer(tapGesture)
        imageStart.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(PlayView.imageTapped2(gesture:)))
        imageStart2.addGestureRecognizer(tapGesture2)
        imageStart2.isUserInteractionEnabled = true
        
        view.addSubview(labelStart)
        labelStart.textColor = UIColor(red: 0.75, green: 0.82, blue: 0.22, alpha: 1.00)
        
        rectangle1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle4.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle5.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle6.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle7.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle8.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle9.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle10.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle11.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        rectangle12.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
        
    }
    
    // Gesture Recognizer Level 1
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        UIView.animate(withDuration: 0.6, delay: 0, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.playTouchSound()
            self.imageStart.frame.origin.x -= 800
            self.labelStart.frame = CGRect(x: 53, y: 63, width: 236, height: 168)
        })
        self.labelStart.textColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
        self.labelStart.font = UIFont(name: "Arial Rounded MT Bold", size: 80)
        self.labelStart.text = timeString(time: TimeInterval(seconds))
        self.start()
    }
    
    // Gesture Recognizer Level 2
    @objc func imageTapped2(gesture: UIGestureRecognizer) {
        UIView.animate(withDuration: 0.6, delay: 0, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.playTouchSound()
            self.imageStart2.frame.origin.x -= 800
            self.labelStart.frame = CGRect(x: 53, y: 63, width: 236, height: 168)
        })
        
        self.labelStart.textColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
        self.labelStart.font = UIFont(name: "Arial Rounded MT Bold", size: 80)
        self.labelStart.text = timeString(time: TimeInterval(seconds))
        self.start()
    }
    
    
    //Gesture Recognizer Block Rectangle Color
    @objc func handler(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: self.view)
        let draggedView = gesture.view
        if gesture.state == .began {
            rectangleOriginPositionBeforeMove = draggedView!.frame.origin
        }else if gesture.state == .ended {
            if draggedView!.frame.intersects(rectangleWhite1.frame) && draggedView!.accessibilityIdentifier == rectangleWhite1.accessibilityIdentifier && isRectWhiteOneFilled == false {
                // Save status
                playSoundRectangle()
                self.isRectWhiteOneFilled = true
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.initialMovableViewPosition = .zero
                    gesture.isEnabled = false
                    draggedView!.center = self.rectangleWhite1.center
                }, completion: nil)
            } else if draggedView!.frame.intersects(rectangleWhite2.frame) && draggedView!.accessibilityIdentifier == rectangleWhite2.accessibilityIdentifier && isRectWhiteTwoFilled == false{
                playSoundRectangle()
                // Save status
                self.isRectWhiteTwoFilled = true
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.initialMovableViewPosition = .zero
                    gesture.isEnabled = false
                    draggedView!.center = self.rectangleWhite2.center
                }, completion: nil)
            }else if draggedView!.frame.intersects(rectangleWhite3.frame) && draggedView!.accessibilityIdentifier == rectangleWhite3.accessibilityIdentifier && isRectWhiteThreeFilled == false{
                playSoundRectangle()
                // Save status
                self.isRectWhiteThreeFilled = true
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.initialMovableViewPosition = .zero
                    gesture.isEnabled = false
                    draggedView!.center = self.rectangleWhite3.center
                }, completion: nil)
            }else if draggedView!.frame.intersects(rectangleWhite4.frame) && draggedView!.accessibilityIdentifier == rectangleWhite4.accessibilityIdentifier && isRectWhiteFourFilled == false{
                playSoundRectangle()
                // Save status
                self.isRectWhiteFourFilled = true
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.initialMovableViewPosition = .zero
                    gesture.isEnabled = false
                    draggedView!.center = self.rectangleWhite4.center
                }, completion: nil)
            }else if draggedView!.frame.intersects(rectangleWhite5.frame) && draggedView!.accessibilityIdentifier == rectangleWhite5.accessibilityIdentifier && isRectWhiteFiveFilled == false{
                playSoundRectangle()
                // Save status
                self.isRectWhiteFiveFilled = true
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.initialMovableViewPosition = .zero
                    gesture.isEnabled = false
                    draggedView!.center = self.rectangleWhite5.center
                }, completion: nil)
            }else{
                draggedView?.frame.origin = rectangleOriginPositionBeforeMove
                playSoundFailed()
            }
            if(isRectWhiteOneFilled == true && isRectWhiteTwoFilled == true && isRectWhiteThreeFilled == true  && isRectWhiteFourFilled == true  && isRectWhiteFiveFilled == true ){
                timer.invalidate()
                if currentLevel == 1{
                    showPopUpWin()
                }else if currentLevel == 2{
                    showPopUpWin2()
                }
            }
        }else if gesture.state == .changed {
            draggedView?.center = location
        }
        
    }
    
    //MARK: Show File Audios
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
    
    public func playAlarm(){
        self.playSound(file: "Sound Alarm", fileExtension: "wav")
    }
    
    public func playSoundRectangle(){
        self.playSound(file: "Sound Rectangle2", fileExtension: "wav")
    }
    
    public func playSoundFailed(){
        self.playSound(file: "Sound Failed", fileExtension: "wav")
    }
    
    public func playTouchSound(){
        self.playSound(file: "Touch Sound2", fileExtension: "mp3")
    }
    
    public func playSoundWin(){
        self.playSound(file: "Sound Win", fileExtension: "wav")
    }
    
    public func playSoundStart(){
        self.playSound(file: "Start Sound", fileExtension: "wav")
    }
    
    
    //MARK: Show Pop Up
    public func showPopUpWin(){
        playSoundWin()
        view.addSubview(imageYouWin)
        view.addSubview(buttonRestart)
        view.addSubview(buttonInfo)
        view.addSubview(buttonNext)
        
        buttonRestart.addTarget(self, action: #selector(Restart), for: .touchUpInside)
        buttonInfo.addTarget(self, action: #selector(actionGoToGuideView(_:)), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(NextLevel), for: .touchUpInside)
    }
    
    public func showPopUpWin2(){
        playSoundWin()
        view.addSubview(imageYouWin)
        view.addSubview(buttonRestart)
        view.addSubview(buttonInfo)
        view.addSubview(buttonNext)
        buttonRestart.addTarget(self, action: #selector(Restart), for: .touchUpInside)
        buttonInfo.addTarget(self, action: #selector(actionGoToGuideView(_:)), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(NextDisclaimer), for: .touchUpInside)
    }
    
    @objc public func NextDisclaimer(){
        playTouchSound()
        showPopUpDisclaimer()
    }
    
    public func showPopUpDisclaimer(){
        playTouchSound()
        view.addSubview(imageDiscalimer)
        view.addSubview(buttonNext)
        buttonNext.frame.origin = CGPoint(x: 350, y: 926.76)
        
        buttonNext.addTarget(self, action: #selector(NextImgWWDC), for: .touchUpInside)
    }
    
    @objc public func NextImgWWDC(){
        playTouchSound()
        view.addSubview(imageEndWWDC)
        view.addSubview(buttonArrowWWDC)
        
        buttonArrowWWDC.addTarget(self, action: #selector(actionHomeView), for: .touchDown)
    }
    
    @objc public func actionHomeView(){
        playTouchSound()
        navigationController?.pushViewController(HomeView(), animated: true)
    }
    
    
    @objc func actionGoToGuideView(_ sender: UIButton){
        playTouchSound()
        navigationController?.pushViewController(GuideView(), animated: true)
    }
    
    
    public func showPopUpTimesup(){
        view.addSubview(imageTimesup)
        view.addSubview(buttonTimesup)
        
        buttonTimesup.addTarget(self, action: #selector(Restart), for: .touchUpInside)
    }
    
    //Next Level
    @objc public func NextLevel(){
        playTouchSound()
        let vc = PlayView()
        if currentLevel == 1{
            vc.currentLevel += 1
        }else if currentLevel == 2{
            vc.currentLevel += 2
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc public func Restart(){
        playTouchSound()
        let vc = PlayView()
        if currentLevel == 1{
            vc.currentLevel = 1
        }else if currentLevel == 2{
            vc.currentLevel = 2
        }
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    //Set Timer
    func timeString(time: TimeInterval) -> String{
        let seconds = Int(time) % 60
        let minutes = Int(time) / 60 % 60
        return String(format: "%02i:%02i", minutes, seconds)
        
    }
    
    @objc func updateTimer(){
        if seconds < 1{
            seconds = 15
            labelStart.text = timeString(time: TimeInterval(seconds))
            timer.invalidate()
            labelStart.isHidden = true
            imageTimer.frame = CGRect(x: 311, y: 60, width: 180, height: 175)
            shakeAlarm()
            playAlarm()
            showPopUpTimesup()
        }
        else{
            seconds -= 1
            labelStart.text = timeString(time: TimeInterval(seconds))
            
        }
    }
    
    func start(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayView.updateTimer), userInfo: nil, repeats: true)
    }
    
    //Function Shake Label timer
    @objc private func shakeAlarm() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 8
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageTimer.center.x - 10, y: imageTimer.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: imageTimer.center.x + 10, y: imageTimer.center.y))
        imageTimer.layer.add(animation, forKey: "position")
    }
    
    //Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
