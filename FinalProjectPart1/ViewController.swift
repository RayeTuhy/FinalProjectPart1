//
//  ViewController.swift
//  FinalProjectPart1
//
//  Created by RAY ANNE TUHY on 5/1/19.
//  Copyright © 2019 RAY ANNE TUHY. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var textFieldTo: UITextField!
    @IBOutlet weak var textFieldSubject: UITextField!
    @IBOutlet weak var textViewBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonHandlerSendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailComposer()
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([self.textFieldTo.text!])
        mailComposeVC.setSubject(self.textFieldSubject.text!)
        mailComposeVC.setMessageBody(self.textViewBody.text!, isHTML: false)
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["RL200485@stu.rlas-116.org"])
        mailComposeVC.setSubject("Sending you an in-app e-mail...")
        mailComposeVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        }else{
            print("Can't send email")
        }
    }
    
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([self.textFieldTo.text!])
        mailComposeVC.setSubject(self.textFieldSubject.text!)
        mailComposeVC.setMessageBody(self.textViewBody.text!, isHTML: false)
        return mailComposeVC
        }
    //MARK: - MFMail compose method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Swift.Error?) {
        controller.dismiss(animated: true) { () -> Void in }
    }
  
}




