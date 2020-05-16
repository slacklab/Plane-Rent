//
//  RentPlaneVC.swift
//  Plane rent
//
//  Created by Ivan Sorokoletov on 13.05.2020.
//  Copyright © 2020 Slacklab. All rights reserved.
//

import UIKit

class RentPlaneVC: BaseViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var selectedCell: Int = 0
    var helicopters = [Helicopter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: extra code
        print(selectedCell)
        
        modelLabel.text = helicopters[selectedCell].helicopter_model
        baseLabel.text = helicopters[selectedCell].helicopter_base
        priceLabel.text = helicopters[selectedCell].helicopter_price
        
        
        let helicopterImagesDir = "http://big-marka.xyz/helicopter_images/"
        
        if let imageURL = URL(string:
            ((helicopterImagesDir + helicopters[selectedCell].helicopter_image)
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        )) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.mainImage.image = image
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
