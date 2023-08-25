//
//  GetsVC.swift
//  GAMaps
//
//  Created by admin on 13/07/23.
//

import UIKit

class GetsVC: UIViewController {
    
    var isgoogle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onclickGetCurrentLocation(_ sender: UIButton) {
        if isgoogle == "yes" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "CurrentLocationVC") as! CurrentLocationVC
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "AppleCurrentLocVC") as! AppleCurrentLocVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func onclickGetCurrentWithDefaultPinLocation(_ sender: UIButton) {
        if isgoogle == "yes" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "CLDefaultPinVC") as! CLDefaultPinVC
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "CLDefaultPinAppleVC") as! CLDefaultPinAppleVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func onclickGetCurrentWithCustomPinLocation(_ sender: UIButton) {
        if isgoogle == "yes" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "CLCustomPinVC") as! CLCustomPinVC
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "CLcustomPinAppleVC") as! CLcustomPinAppleVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func onclickGetCurrentWithserarchAddress(_ sender: UIButton) {
        if isgoogle == "yes" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "searchaddressVC") as! searchaddressVC
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "searchAppleVC") as! searchAppleVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func onclickDrowPolylinewithtwoletlong(_ sender: UIButton) {
        if isgoogle == "yes" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PolyLineTwoLetLong") as! PolyLineTwoLetLong
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "PolyLineAppleVC") as! PolyLineAppleVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
