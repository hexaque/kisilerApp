//
//  KisiDetayProtocols.swift
//  KisilerUygulamasi
//
//  Created by Que on 9.10.2022.
//

import Foundation

protocol ViewToPresenterKisiDetayProtocol{
    var kisiDetayInteractor:PresenterToInteractorKisiDetayProtocol?{get set}
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String)
}

protocol PresenterToInteractorKisiDetayProtocol{
    func kisiGuncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String)
}

protocol PresenterToRouterKisiDetayProtocol{
    static func  createModule(ref:KisiDetayVC)
}
