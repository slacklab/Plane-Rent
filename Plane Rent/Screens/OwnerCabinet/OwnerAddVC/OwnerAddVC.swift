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
    
    // Cell indexes
    let cellIndexAddImage = 0
    let cellIndexCheckHelicopter = 1
    let cellIndexCheckPlane = 2
    let cellIndexModelTextField = 3
    let cellIndexPriceTextField = 4
    let cellIndexAircraftOwnType = 5
    let cellIndexBaseTextField = 6
    let cellIndexEAWSOrTypeTextfield = 7
    let cellIndexSLGTextField = 8
    let cellIndexMinReqsLabel = 9
    let cellIndexFlightBaseHours = 10
    let cellIndexFlightTypeHours = 11
    let cellIndexCheckFlightLabel = 12
    let cellIndexCheckFlightYes = 13
    let cellIndexCheckFlightNo = 14
    let cellIndexCheckFlightHours = 15
    let cellIndexAerodromOpportunityLabel = 16
    let cellIndexCheckAerodromOpportunityYes = 17
    let cellIndexCheckAerodromOpportunityNo = 18
    let cellIndexMinHoursForPodlet = 19
    let cellIndexDoneButton = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Добавить ЛА"
        
        tableView.dataSource = self
        tableView.delegate = self

        
        // Register all xib cells
        
        let nibNameRight = UINib(nibName: "AddImageCell", bundle: nil)
        tableView.register(nibNameRight, forCellReuseIdentifier: "AddImageCell")
        
        let nibName = UINib(nibName: "TextFieldCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TextFieldCell")
        
        let nibNameAir = UINib(nibName: "CheckCell", bundle: nil)
        tableView.register(nibNameAir, forCellReuseIdentifier: "CheckCell")
        
        tableView.tableFooterView = UIView()
    }
    
    override func dismissKeyboardOnTap() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddImageCell", for: indexPath) as! AddImageCell
            cell.commonInit(image: R.image.bgLaunchPlane()!)
            
            return cell
        }
        
        
        return UITableViewCell()
    }
}
