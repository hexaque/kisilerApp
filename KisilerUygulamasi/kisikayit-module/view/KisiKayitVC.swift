//
//  KisiKayitVC.swift
//  KisilerUygulamasi
//
//  Created by Que on 2.10.2022.
//

import UIKit

class KisiKayitVC: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    
    @IBOutlet weak var tfKisiTel: UITextField!
    var kisiKayitPresenterNesnesi : ViewToPresenterKisiKayitProtocol?
    
    override func viewDidLoad() {
        KisiKayitRouter.createModule(ref: self)
        super.viewDidLoad()

     
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text {
            kisiKayitPresenterNesnesi?.ekle(kisi_ad: ka, kisi_tel: kt)
           
        }
        
        
    }
    
    
    
 

}

