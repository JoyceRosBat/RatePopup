//
//  RatePopup.swift
//  RatePopupDemo
//
//  Created by Joyce Rosario Batista on 01/07/2019.
//

import UIKit

@objc protocol RatePopupDelegate:AnyObject {
    @objc optional func onClickRatePopupOK(score:Int, comments:String)
    @objc optional func onClickRatePopupCancel()
}

@objc class RatePopup: UIViewController {
    
    @objc weak var ratePopupDelegate:RatePopupDelegate?

    @IBOutlet weak var stacksSpace: NSLayoutConstraint!
    //Outlets:
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet private var starsCollection: [UIButton]!
    @IBOutlet weak private var moreDetailsTextField: UITextField!
    @IBOutlet weak private var okButton: UIButton!
    @IBOutlet weak private var cancelButton: UIButton!
    
    private var moreDetailsPlaceHolder:String! = ""
    private var messageText:String!
    private var okTitle:String!
    private var cancelTitle:String!
    
    private var messageColor:UIColor!
    private var starsColor:UIColor!
    private var okButtonColor:UIColor!
    private var cancelButtonColor:UIColor!
    private var okButtonBackgroundColor:UIColor!
    private var cancelButtonBackgroundColor:UIColor!
    
    private var score:Int!
    private var heightUp:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightUp = 60;
        moreDetailsTextField?.alpha = 0;
        score = 0;
        stacksSpace.constant = 5;
        moreDetailsTextField?.text = ""

        setTextFieldUnderlined()
        setCustomOptions()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        tapped.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapped)
    }
    
    fileprivate func setTextFieldUnderlined() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: moreDetailsTextField.frame.height + 5, width: moreDetailsTextField.frame.width, height: 1.0)
        bottomLine.borderWidth = 2;
        bottomLine.borderColor = UIColor.darkGray.cgColor
        bottomLine.backgroundColor = UIColor.white.cgColor
        moreDetailsTextField.borderStyle = UITextField.BorderStyle.none
        moreDetailsTextField.layer.addSublayer(bottomLine)
    }
    
    fileprivate func setCustomOptions() {
        if moreDetailsPlaceHolder != nil { moreDetailsTextField?.placeholder = moreDetailsPlaceHolder }
        if messageText != nil { messageLabel?.text = messageText }
        if messageColor != nil { messageLabel?.textColor = messageColor }
        if starsColor != nil {
            for starButton in starsCollection {
                starButton.setTitleColor(starsColor, for: .normal)
            }
        }
        if okTitle != nil { okButton?.setTitle(okTitle, for: .normal) }
        if okButtonColor != nil { okButton?.setTitleColor(okButtonColor, for: .normal) }
        if okButtonBackgroundColor != nil { okButton?.backgroundColor = okButtonBackgroundColor }
        if cancelTitle != nil { cancelButton?.setTitle(cancelTitle, for: .normal) }
        if cancelButtonColor != nil { cancelButton?.setTitleColor(cancelButtonColor, for: .normal) }
        if cancelButtonBackgroundColor != nil { cancelButton?.backgroundColor = cancelButtonBackgroundColor }
    }
    
    /// Set header message
    @objc func setMessage(_ message:String) {
        messageText = message;
    }
    
    /// Set text color
    @objc func setMessageColorText(_ color:UIColor) {
        messageColor = color;
    }
    
    /// Set placeholder for More Details textfield
    @objc func setMoreDetailsPlaceHolder(_ placeHolder:String) {
        moreDetailsPlaceHolder = placeHolder;
    }
    
    /// Set stars color
    @objc func setStarsColor(_ color:UIColor) {
        starsColor = color;
    }
    
    /// Set title for Ok button
    @objc func setOkButtonTitle(_ title:String) {
        okTitle = title;
    }
    
    /// Set title for Cancel button
    @objc func setCancelButtonTitle(_ title:String) {
        cancelTitle = title;
    }
    
    /// Set color for title on Ok button
    @objc func setOkButtonTitleColor(_ color:UIColor) {
        okButtonColor = color;
    }
    
    /// Set color for title on Cancel button
    @objc func setCancelButtonTitleColor(_ color:UIColor) {
        cancelButtonColor = color;
    }
    
    /// Set background color for Ok button
    @objc func setOkButtonBackgroundColor(_ color:UIColor) {
        okButtonBackgroundColor = color;
    }
    
    /// Set background color for Cancel button
    @objc func setCancelButtonBackgroundColor(_ color:UIColor) {
        cancelButtonBackgroundColor = color;
    }

    @IBAction fileprivate func onTouchStar(_ star: UIButton) {
        let starTag:Int = star.tag;
        score = starTag + 1;
        stacksSpace.constant = 78;
        moreDetailsTextField?.alpha = 1;
        
        for starButton in starsCollection {
            if(starButton.tag <= starTag) {
                starButton.setTitle("★", for: .normal)
            } else {
                starButton.setTitle("☆", for: .normal)
            }
        }
    }
    
    @IBAction fileprivate func onTouchOK(_ sender: Any) {
        dismiss(animated: false, completion: {
            self.ratePopupDelegate?.onClickRatePopupOK?(score: self.score, comments: self.moreDetailsTextField.text!)
        })
    }
    
    @IBAction fileprivate func onTouchCancel(_ sender: Any) {
        dismiss(animated: false, completion: {
            self.ratePopupDelegate?.onClickRatePopupCancel?()
        })
    }
    
    @objc fileprivate func closeKeyboard() {
        moreDetailsTextField.resignFirstResponder()
    }
    
    @objc fileprivate func keyboardWillShow(notification: Notification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= heightUp
            }
        }
        
    }
    
    @objc fileprivate func keyboardWillHide(notification: Notification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += heightUp
            }
        }
    }

}
