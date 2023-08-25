//
//  ViewController.swift
//  GAMaps
//
//  Created by admin on 10/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onclickGoogleMap(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GetsVC") as! GetsVC
        vc.isgoogle = "yes"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onclickAppleMap(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GetsVC") as! GetsVC
        navigationController?.pushViewController(vc, animated: true)
    }


}

