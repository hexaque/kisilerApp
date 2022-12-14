//
//  KisiKayitInteractor.swift
//  KisilerUygulamasi
//
//  Created by Que on 9.10.2022.
//

import Foundation
class KisiKayitInteractor:PresenterToInteractorKisiKayitProtocol{
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        //print("Kişi Kayıt : \(kisi_ad) - \(kisi_tel)")
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
            
            }catch{
            
        
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
}
