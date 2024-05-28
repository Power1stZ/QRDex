//
//  PokemonListViewController.swift
//  QRDex
//
//  Created by Wittawas Mukdaprasert on 20/5/2567 BE.
//

import UIKit
import Kingfisher

class PokemonListViewController: UIViewController, UITableViewDataSource {

    var pkmData: PokemonListData?
    override func viewDidLoad() {
        tableView.dataSource = self
        getData()
    }
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pkmData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PokemonItemListCell,
              let data = pkmData?.results[indexPath.row]
        else{
            return UITableViewCell()
        }
   
        cell.apply(data: data)
        return cell
    }
    
    func getData(){
        APIClient.share.request(url: "https://pokeapi.co/api/v2/pokemon/?limit=20", method: .get, onComplete: {(data:PokemonListData) in
            self.pkmData = data
            self.tableView.reloadData()
            print(data)
        }, onError: {(error:String) in
                print(error)
        })

    }
}

class PokemonItemListCell:UITableViewCell{
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var pkmImgView:UIImageView!
    
    func apply(data:PokemonData){
        titleLabel.text = data.name
        let url = URL(string: data.imageURL)
        pkmImgView.kf.setImage(with: url)
    }
}
