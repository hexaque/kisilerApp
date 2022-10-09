//
//  KisiDetayRouter.swift
//  KisilerUygulamasi
//
//  Created by Que on 9.10.2022.
//

import Foundation
class KisiDetayRouter:PresenterToRouterKisiDetayProtocol{
    static func createModule(ref: KisiDetayVC) {
        ref.kisiDetayPresenterNesnesi = KisiDetayPresenter()
        ref.kisiDetayPresenterNesnesi?.kisiDetayInteractor = KisiDetayInteractor()
    }
}
