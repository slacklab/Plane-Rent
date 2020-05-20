//
//  OwnerVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 20.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class OwnerVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var name: String = ""
    var lastName: String = ""
    
//    let houseData = ["Arryn", "Baratheon", "Greyjoy", "Lannister", "Martell", "Stark", "Targaryen", "Tully", "Tyrell"]
    let houseData = ["Arryn", "Baratheon"]
        
    let wordsData = ["As high as honor", "Ours is the fury", "We do not sow", "Hear me roar", "Unbowed, unbent, unbroken", "Winter is coming", "fire and blood", "Family, duty, honor", "Growing strong"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Хочу сдать в аренду"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibNameRight = UINib(nibName: "ProfileCell", bundle: nil)
        tableView.register(nibNameRight, forCellReuseIdentifier: "ProfileCell")
        
        let nibName = UINib(nibName: "TypeTitleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.item % 2 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.commonInit("got_\(indexPath.item)", title: houseData[indexPath.item], sub: wordsData[indexPath.item], buttonImage: R.image.doneBlue()!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TypeTitleCell
            cell.commonInit(title: houseData[indexPath.item])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailVC()
//        vc.commonInit("got_bg_\(indexPath.item)", title: houseData[indexPath.item])
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.tableView.deselectRow(at: indexPath, animated: true)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func dismissKeyboardOnTap() {
        
    }

}


