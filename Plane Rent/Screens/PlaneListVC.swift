//
//  PlaneListVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class PlaneListVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    final let url = URL(string: "http://big-marka.xyz/DB_SELECT_AIRPLANES.php?where=none")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson()
    }
    
    func downloadJson() {
        guard let downloadUrl = url else { return }
        
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            print("downloaded")
        }.resume()
    }
    

}
