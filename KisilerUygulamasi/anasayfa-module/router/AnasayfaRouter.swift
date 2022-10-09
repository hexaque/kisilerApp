//
//  AnasayfaRouter.swift
//  KisilerUygulamasi
//
//  Created by Que on 9.10.2022.
//

import Foundation
class AnasayfaRouter:PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        
        //taşıyıcı protokoller
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
        
    }
    
    
}
