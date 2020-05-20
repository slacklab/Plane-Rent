//
//  OwnerVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 20.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

//class OwnerVC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}

class OwnerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let houseData = ["Arryn", "Baratheon", "Greyjoy", "Lannister", "Martell", "Stark", "Targaryen", "Tully", "Tyrell"]

        
    let wordsData = ["As high as honor", "Ours is the fury", "We do not sow", "Hear me roar", "Unbowed, unbent, unbroken", "Winter is coming", "fire and blood", "Family, duty, honor", "Growing strong"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UITableView"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "TypeTitleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
        
        let nibNameRight = UINib(nibName: "ProfileCell", bundle: nil)
        tableView.register(nibNameRight, forCellReuseIdentifier: "ProfileCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.item % 2 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.commonInit("got_\(indexPath.item)", title: houseData[indexPath.item], sub: wordsData[indexPath.item])
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


}


