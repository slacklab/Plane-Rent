//
//  HelicopterListVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 16.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import Foundation
import UIKit

class HelicopterListVC: BaseViewController, UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    final let url = URL(string: "http://big-marka.xyz/DB_SELECT_HELICOPTERS.php?where=none")
    private var helicopters = [Helicopter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson()
        tableView.tableFooterView = UIView()
    }
    
    func downloadJson() {
        guard let downloadUrl = url else { return }
        
        URLSession.shared.dataTask(with: downloadUrl) { data, urlResponse, error in
            
            guard let data = data, error == nil, urlResponse != nil else {
                print("smth wrong")
                return
            }
            
            print("downloaded")
            
            do {
                let decoder = JSONDecoder()
                
                let downloadHelicopters = try decoder.decode(Helicopters.self, from: data)
                
                self.helicopters = downloadHelicopters.air_helicopters
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("smth wrong after download")
            }
            
        }.resume()
    }
}

extension HelicopterListVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helicopters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaneCell") as? PlaneCell else { return UITableViewCell() }
        
        cell.planeAirportLabel.text = helicopters[indexPath.row].helicopter_price
        cell.planeModelLabel.text = helicopters[indexPath.row].helicopter_price
        cell.planePriceLabel.text = helicopters[indexPath.row].helicopter_price
        
        let helicopterImagesDir = "http://big-marka.xyz/helicopter_images/"
        
        if let imageURL = URL(string:
            ((helicopterImagesDir + helicopters[indexPath.row].helicopter_image)
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        )) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.planeImage?.image = image
                    }
                }
            }
        }
        
        return cell
    }
}
