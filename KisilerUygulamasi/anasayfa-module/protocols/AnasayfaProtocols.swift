//
//  AnasayfaProtocols.swift
//  KisilerUygulamasi
//
//  Created by Que on 9.10.2022.
//

import Foundation
protocol ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol?{get set}
    var anasayfaView : PresenterToViewAnasayfaProtocol?{get set}
    
    func KisileriAl()
    func Ara(aramaKelimesi:String)
    func Sil(kisi_id:Int)
}
protocol PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?{get set}
    func tumKisileriAl()
    func kisiAra(aramaKelimesi:String)
    func kisiSil(kisi_id:Int)
}



//taşıma protokolleri
protocol InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(kisilerListesi:[Kisiler])
}

protocol PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(kisilerListesi:[Kisiler])
}

//router
protocol PresenterToRouterAnasayfaProtocol{
   static func createModule(ref: AnasayfaVC)
}
