//
//  OwnerVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 20.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class OwnerVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentName: String = ""
    var currentLastName: String = ""
    
    var currentPhone = ""
        
    var url = URL(string: "")
    
    private var planes = [Plane]()
    
    var cell : UITableViewCell = UITableViewCell()
        
    // important!!! else out of range maybe
    let additionalCellsWithoutPlanes = 2
    
    
    // MARK: - Cell indexes
    
    let profileCellIndex = 0
    let typeAircraftTitleIndex = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPhone = defaults.string(forKey: UserDefaultList.currentPhoneNumberOfUser) ?? ""
        currentName = defaults.string(forKey: UserDefaultList.currentAccountName) ?? ""
        currentLastName = defaults.string(forKey: UserDefaultList.currentAccountLastName) ?? ""
        
        url = URL(string: "\(Links.apiPath)DB_SELECT_AIRPLANES_BY_PHONE.php?where=\(currentPhone)")
        
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
        
        downloadJson()
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return additionalCellsWithoutPlanes + planes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("in cellForRowAt \(indexPath.row)")
        
        if (indexPath.item == profileCellIndex) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.commonInit(title: currentName, sub: currentLastName, buttonImage: R.image.roundButton()!)
            return cell
        } else if (indexPath.item == typeAircraftTitleIndex){
            let cell = tableView.dequeueReusableCell(withIdentifier: "TypeTitleCell", for: indexPath) as! TypeTitleCell
            cell.commonInit(title: "Самолеты и вертолеты")
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AircraftCell", for: indexPath) as! AircraftCell
            
            let rightIndexPathRow = indexPath.row - additionalCellsWithoutPlanes
            cell.commonInit(isLoadImage: false, R.image.bgRect()!, title: planes[rightIndexPathRow].plane_base, sub: planes[rightIndexPathRow].plane_model, subSub: planes[rightIndexPathRow].plane_price)
            
            print("after cell \(indexPath.row)")
            
            let planeImagesDir = "\(Links.apiPath)plane_images/"
            
            if let imageURL = URL(string:
                ((planeImagesDir + planes[rightIndexPathRow].plane_image)
                    .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            )) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.commonInit(isLoadImage: true, image!, title: self.planes[rightIndexPathRow].plane_base, sub: self.planes[rightIndexPathRow].plane_model, subSub: self.planes[rightIndexPathRow].plane_price)
                            //                        cell.planeImage?.image = image
                        }
                    }
                }
            }
            
            return cell
        } //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == profileCellIndex {
            return 225
        }
        
        if indexPath.row == typeAircraftTitleIndex {
            return 50
        }
        
        
        
        return 225
    }
    
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
