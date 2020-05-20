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
    
    final let url = URL(string: "http://big-marka.xyz/DB_SELECT_AIRPLANES_BY_PHONE.php?where=none")
    
    private var planes = [Plane]()
    
    var cell : UITableViewCell = UITableViewCell()

    let houseData = ["Arryn", "Baratheon"]
    
    // important!!! else out of range maybe
    let additionalCellsWithoutPlanes = 2
    
    let wordsData = ["As high as honor", "Ours is the fury", "We do not sow", "Hear me roar", "Unbowed, unbent, unbroken", "Winter is coming", "fire and blood", "Family, duty, honor", "Growing strong"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Хочу сдать в аренду"
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register all cells storyboards too
        
        let nibNameRight = UINib(nibName: "ProfileCell", bundle: nil)
        tableView.register(nibNameRight, forCellReuseIdentifier: "ProfileCell")
        
        let nibName = UINib(nibName: "TypeTitleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TypeTitleCell")
        
        let nibNameAir = UINib(nibName: "AircraftCell", bundle: nil)
        tableView.register(nibNameAir, forCellReuseIdentifier: "AircraftCell")
        
//        tableView.register(cell.classForCoder, forCellWithReuseIdentifier: "PlaneCell")
//        tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
//        
//        tableView.register(<#T##aClass: AnyClass?##AnyClass?#>, forHeaderFooterViewReuseIdentifier: <#T##String#>)

        
        downloadJson()
        tableView.tableFooterView = UIView()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return houseData.count + planes.count
        return additionalCellsWithoutPlanes + planes.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("in cellForRowAt")
        
                if (indexPath.item == 0) {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
                    cell.commonInit("bg-rect", title: "Title", sub: "Sub", buttonImage: R.image.roundButton()!)
                    return cell
                } else if (indexPath.item == 1){
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TypeTitleCell", for: indexPath) as! TypeTitleCell
                    cell.commonInit(title: "Planes or helics")
                    return cell
                } else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AircraftCell", for: indexPath) as! AircraftCell
                    
        let rightIndexPathRow = indexPath.row - additionalCellsWithoutPlanes
        cell.commonInit(R.image.bgRect()!, title: planes[rightIndexPathRow].plane_base, sub: planes[rightIndexPathRow].plane_model, subSub: planes[rightIndexPathRow].plane_price)
                    return cell
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaneCell", for: indexPath) as? PlaneCell else { return UITableViewCell() }
        
        
        print("after cell")
        
        print(planes[rightIndexPathRow].plane_base)
        
//        cell.planeAirportLabel.text = planes[indexPath.row].plane_base
//        cell.planeModelLabel.text = planes[indexPath.row].plane_model
//        cell.planePriceLabel.text = planes[indexPath.row].plane_price
        
        let planeImagesDir = "http://big-marka.xyz/plane_images/"
        
        if let imageURL = URL(string:
            ((planeImagesDir + planes[rightIndexPathRow].plane_image)
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        )) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.commonInit(image!, title: self.planes[rightIndexPathRow].plane_base, sub: self.planes[rightIndexPathRow].plane_model, subSub: self.planes[rightIndexPathRow].plane_price)
//                        cell.planeImage?.image = image
                    }
                }
            }
        }
        
        return cell
                } //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        if indexPath.row == 0 {
        //            return 225
        //        }
        //
        //        if indexPath.row == 1 {
        //            return 50
        //        }
        
        return 225
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
    
    // MARK: - donwload planes by phone
    
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


