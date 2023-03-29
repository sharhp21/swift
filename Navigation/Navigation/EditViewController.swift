//
//  EditViewController.swift
//  Navigation
//
//  Created by ssg on 2023/03/29.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageResizeDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var IblWay: UILabel!
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var swisOn: UISwitch!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        IblWay.text = textWayValue
        txtMessage.text = textMessage
        swisOn.isOn = isOn
        if isZoom {
            btnResize.setTitle("축소", for: .normal)
        } else {
            btnResize.setTitle("확대", for: .normal)
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageResizeDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        if isZoom {
            btnResize.setTitle("확대", for: .normal)
        } else {
            btnResize.setTitle("축소", for: .normal)
        }
        
        isZoom = !isZoom
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
