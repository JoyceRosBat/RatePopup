//
//  ViewController.swift
//  RatePopupDemo-Swift
//
//  Created by Joyce Rosario Batista on 03/07/2019.
//

import UIKit

class ViewController: UIViewController, RatePopupDelegate {

    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onPressPresentRatePopup(_ sender: Any) {
        let ratePopup = RatePopup()
        
        ratePopup.ratePopupDelegate = self
        
        ratePopup.setMessage("How do you value our service?")
        ratePopup.setMoreDetailsPlaceHolder("Add more details (Optional)")
        ratePopup.setOkButtonTitle("Send")
        ratePopup.setCancelButtonTitle("Close")
      
        self.present(ratePopup, animated: false, completion: nil)
    }
    
    func onClickRatePopupOK(score: Int, comments: String) {
        scoreLabel.text = String(score)
    }
}

