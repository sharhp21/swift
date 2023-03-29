//
//  ViewController.swift
//  Navigation
//
//  Created by ssg on 2023/03/29.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    // 해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수며 데이터 전달을 위해 사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }

    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageResizeDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        if isZoom && !self.isZoom {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            self.isZoom = isZoom
        } else if !isZoom && self.isZoom {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            self.isZoom = isZoom
        }
    }
    
}

