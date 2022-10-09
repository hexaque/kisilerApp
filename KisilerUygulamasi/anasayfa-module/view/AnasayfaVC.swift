//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Que on 2.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var kisilerListe = [Kisiler]()
    
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        veriTabaniKopyala()
        
        
        searchBar.delegate = self  // yetkilendirme protokol ile bağlantı kuruldu
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        AnasayfaRouter.createModule(ref: self)
        
       /* let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "11111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ece", kisi_tel: "22222")
        kisilerListe.append(k1)
        kisilerListe.append(k2)*/

    }

    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.KisileriAl()
        //anasayfaya donulunce verileri alıcaz
    }
    
    
    
    
    
    
    
    
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let kisi = sender as? Kisiler{
                let gidilecekVC = segue.destination as! KisiDetayVC
                gidilecekVC.kisi=kisi
            }
        }
    }
    
    
    
    
  
    func veriTabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı Daha önce kopyalanmış.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                
            }catch{
                print(error)
            }
        }
        
    }
    
    
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(kisilerListesi: [Kisiler]) {
        self.kisilerListe = kisilerListesi
        self.kisilerTableView.reloadData()
    }
    
    
}

extension AnasayfaVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.Ara(aramaKelimesi: searchText)
    }
    
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! TableViewHucre
        hucre.kisiBilgiLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        print("\(kisi.kisi_ad!) seçildi")
        tableView.deselectRow(at: indexPath, animated: true) // animasyon
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        
        let silAction = UIContextualAction(style: .destructive, title: "sil"){(contextualAction ,view ,bool )in
            let kisi = self.kisilerListe[indexPath.row]
            
            
            let alert = UIAlertController(title: "Silme işlemi", message: "\(kisi.kisi_ad!) silinsin mi ?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){
                action in
                self.anasayfaPresenterNesnesi?.Sil(kisi_id: kisi.kisi_id!)
                
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}
