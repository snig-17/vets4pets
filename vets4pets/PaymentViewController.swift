// Start of PaymentViewController.swift
//
//  PaymentViewController.swift
//  vets4pets
//
//  Created by Snigdha Tiwari on 02/02/24.
//

import Foundation
import UIKit
import Razorpay


class PaymentViewController: UIViewController{
    
    private var razorpay:Razorpay?
    

    
    @IBOutlet weak var paymentbutton: UIButton!
    
    
    
    @IBAction func paymentClicked(_ sender: Any) {
        
        let options: [String:Any] = [
                       "amount" : "100" //mandatory in paise like:- 1000 paise ==  10 rs
                       "description": "purchase description"
                       "image": "https://url-to-image.png",
                       "name": "business or product name"
                       "prefill": [
                           "contact": "9797979797",
                           "email": "foo@bar.com"
                       ],
                       "theme": [
                           "color": "#F37254"
                         ]
                   ]
        
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
           razorpay = Razorpay.initWithKey("rzp_test_FYCQAsmKTFF8FR", andDelegate: self)
        }
            
            
            
            
            
            
}

extension PaymentViewController: RazorpayPaymentCompletionProtocol {
            func onPaymentSuccess(_ payment_id: String) {
                let alert = UIAlertController(title: "Paid", message: "Payment Success", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
    
            func onPaymentError(_ code: Int32, description str: String) {
                let alert = UIAlertController(title: "Error", message: "\(code)\n\(str)", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
    }

// End of PaymentViewController.swift
