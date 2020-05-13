//
//  PlaneListVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class PlaneListVC: UIViewController, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    final let url = URL(string: "http://big-marka.xyz/DB_SELECT_AIRPLANES.php?where=none")
    private var planes = [Plane]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson()
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
                
                let downloadedPlanes = try decoder.decode(Planes.self, from: data)
                                
                self.planes = downloadedPlanes.air_airplanes
                DispatchQueue.main.async {
                    self.tableView.reloadData()              
                }
                
            } catch {
                print("smth wrong after download")
            }
            
        }.resume()
    }
}

extension PlaneListVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaneCell") as? PlaneCell else { return UITableViewCell() }
        
        cell.planeAirportLabel.text = planes[indexPath.row].plane_base
        cell.planeModelLabel.text = planes[indexPath.row].plane_model
        cell.planePriceLabel.text = planes[indexPath.row].plane_price
        
        return cell
    }
}
