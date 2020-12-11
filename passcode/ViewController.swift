//
//  ViewController.swift
//  passcode
//
//  Created by Serena on 2020/11/27.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var p1Image: UIImageView!
    @IBOutlet weak var p2Image: UIImageView!
    @IBOutlet weak var p3Image: UIImageView!
    @IBOutlet weak var p4Image: UIImageView!
    
    let correctPasscode = [1, 2, 1, 2]
    var guessPasscode = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p1Image.isHidden = true
        p2Image.isHidden = true
        p3Image.isHidden = true
        p4Image.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func numBtn(_ sender: UIButton) {
        
        let btn = sender.tag
        guessPasscode.append(btn)
        showGuessImage()
                
        
    }
    
    
    @IBAction func deleteBtn(_ sender: Any) {
        if 1...3 ~= guessPasscode.count{
                    guessPasscode.removeLast()
        showGuessImage()
        }
    }
    
    func correctGIF(){
        let imageView = UIImageView(frame: CGRect(x: 70, y: 250, width: 277, height: 99))
          view.addSubview(imageView)
        let animatedImage = UIImage.animatedImageNamed("f5e9fbabc8d14f11c6584fa07534d580LJn3YULHtcjI2Kjr-", duration: 1)
           imageView.image = animatedImage
    }
    
    func checkPasscode(){
        if guessPasscode == correctPasscode{
            correctGIF()
        }else{
            guessPasscode = []
            p1Image.isHidden = true
            p2Image.isHidden = true
            p3Image.isHidden = true
            p4Image.isHidden = true
            let alert = UIAlertController(title: "Incorrect passcode", message: "The passcode you entered is incorrect.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Please try again", style: .default) { (_) in
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }

    }
    
    func showGuessImage(){
        if guessPasscode.count == 0{
            p1Image.isHidden = true
            p2Image.isHidden = true
            p3Image.isHidden = true
            p4Image.isHidden = true
        }else if guessPasscode.count == 1{
            p1Image.isHidden = false
            p2Image.isHidden = true
            p3Image.isHidden = true
            p4Image.isHidden = true
        }else if guessPasscode.count == 2{
            p1Image.isHidden = false
            p2Image.isHidden = false
            p3Image.isHidden = true
            p4Image.isHidden = true
        }else if guessPasscode.count == 3{
            p1Image.isHidden = false
            p2Image.isHidden = false
            p3Image.isHidden = false
            p4Image.isHidden = true
        }else if guessPasscode.count == 4{
            p1Image.isHidden = false
            p2Image.isHidden = false
            p3Image.isHidden = false
            p4Image.isHidden = false
            let delaySeconds = 0.1
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
                self.checkPasscode()
                }
            }
        
        
    }
    
    
    
}
