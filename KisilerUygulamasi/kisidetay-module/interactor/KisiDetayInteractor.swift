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
    
    
}
