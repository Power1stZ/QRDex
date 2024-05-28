//
//  QrDexViewController.swift
//  QRDex
//
//  Created by Wittawas Mukdaprasert on 20/5/2567 BE.
//

import UIKit

class Qr1DisplayViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        let qrGen = QrGenaraterService()
        let value = qrGen.getQRSting(tel: "941240877")
        let image = qrGen.textToImage(text: value)
        imageView.image = image
        
        
    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
