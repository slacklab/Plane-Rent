//
//  OwnerAddVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 24.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class OwnerAddVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Добавить ЛА"

        // Register all xib cells
        
        let nibNameRight = UINib(nibName: "AddImageCell", bundle: nil)
        tableView.register(nibNameRight, forCellReuseIdentifier: "AddImageCell")
        
        let nibName = UINib(nibName: "TypeTitleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TypeTitleCell")
        
        let nibNameAir = UINib(nibName: "AircraftCell", bundle: nil)
        tableView.register(nibNameAir, forCellReuseIdentifier: "AircraftCell")
        
        tableView.tableFooterView = UIView()
    }
    
    override func dismissKeyboardOnTap() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
