//
//  AnasayfaPresenter.swift
//  KisilerUygulamasi
//
//  Created by Que on 9.10.2022.
//

import Foundation
class AnasayfaPresenter: ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func KisileriAl() {
        
        anasayfaInteractor?.tumKisileriAl()
        
    }
    
    func Ara(aramaKelimesi: String) {
        anasayfaInteractor?.kisiAra(aramaKelimesi: aramaKelimesi)
    }
    
    func Sil(kisi_id: Int) {
        anasayfaInteractor?.kisiSil(kisi_id: kisi_id)
    }
    
    
}

extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(kisilerListesi: [Kisiler]) {
        anasayfaView?.vieweVeriGonder(kisilerListesi: kisilerListesi)
    }
    
    
}
