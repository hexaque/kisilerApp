//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Que on 2.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self  // yetkilendirme protokol ile bağlantı kuruldu
        
    }

    
    
    
    
    
    
    
    
    
    @IBAction func buttonDetay(_ sender: Any) {
        let kisi = Kisiler(kisi_id: 8, kisi_ad: "Ece", kisi_tel: "5530223944")
        
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let kisi = sender as? Kisiler{
                let gidilecekVC = segue.destination as! KisiDetayVC
                gidilecekVC.kisi=kisi
            }
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi ara : \(searchText)")
    }
    
    
    
    
    
    
    
    
    
}

