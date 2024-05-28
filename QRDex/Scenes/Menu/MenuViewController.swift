//
//  MenuViewController.swift
//  QRDex
//
//  Created by Wittawas Mukdaprasert on 20/5/2567 BE.
//

import UIKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        
    }
  
    @IBAction func onQrRouter(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "QrDisplay", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController()else{
            return
        }
        self.present(vc, animated: true)
    }
    
    @IBAction func onPokemonRouter(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "PokemonList", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController()else{
            return
        }
        self.present(vc, animated: true)
    }
    
    @IBAction func onInputRouter(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "InputQr", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController()else{
            return
        }
        self.present(vc, animated: true)
    }

}
