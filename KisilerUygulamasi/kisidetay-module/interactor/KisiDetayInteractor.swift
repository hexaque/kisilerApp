//
//  KisiDetayInteractor.swift
//  KisilerUygulamasi
//
//  Created by Que on 9.10.2022.
//

import Foundation

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol{
    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        print("KİŞİ GÜNCELLE \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
}
