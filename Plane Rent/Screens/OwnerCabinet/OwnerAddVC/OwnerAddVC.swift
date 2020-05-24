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
        
        let nibNameLabel = UINib(nibName: "OwnerLabelCell", bundle: nil)
        tableView.register(nibNameLabel, forCellReuseIdentifier: "OwnerLabelCell")
        
        tableView.tableFooterView = UIView()
    }
    
    override func dismissKeyboardOnTap() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 21
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indexRow = indexPath.row
        
        if indexRow == cellIndexAddImage {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddImageCell", for: indexPath) as! AddImageCell
            cell.commonInit(image: R.image.bgLaunchPlane()!)
            
            return cell
        }
        
        if indexRow == cellIndexCheckHelicopter {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath) as! CheckCell
            cell.commonInit(text: "Вертолет")
            
            
            return cell
        }
        
        if indexRow == cellIndexCheckPlane {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath) as! CheckCell
            cell.commonInit(text: "Самолет")
            
            return cell
        }
        
        if indexRow == cellIndexModelTextField {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Модель:")
        
        return cell

        }
        
        if indexRow == cellIndexPriceTextField {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Цена:")
        
        return cell

        }
        
        if indexRow == cellIndexAircraftOwnType {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Собственность или аренда")
        
        return cell

        }
        
        if indexRow == cellIndexBaseTextField {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Базирование:")
        
        return cell

        }
        
        if indexRow == cellIndexEAWSOrTypeTextfield {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Типовой или ЕЭВС:")
        
        return cell

        }
        
        if indexRow == cellIndexSLGTextField {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "СЛГ до (дд.мм.гггг):")
        
        return cell

        }
        
        if indexRow == cellIndexMinReqsLabel {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerLabelCell", for: indexPath) as! OwnerLabelCell
            cell.commonInit(text: "Минимальные требования для самостоятельного вылета:")
        
        return cell

        }
        
        if indexRow == cellIndexFlightBaseHours {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Общий налет:")
        
        return cell

        }
        
        if indexRow == cellIndexFlightTypeHours {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Налет на данном типе:")
        
        return cell

        }
        
        if indexRow == cellIndexCheckFlightLabel {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerLabelCell", for: indexPath) as! OwnerLabelCell
            cell.commonInit(text: "Check Flight:")
        
        return cell

        }
        
        if indexRow == cellIndexCheckFlightYes {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath) as! CheckCell
            cell.commonInit(text: "Да")
            
            
            return cell
        }
        
        if indexRow == cellIndexCheckFlightNo {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath) as! CheckCell
            cell.commonInit(text: "Нет")
            
            return cell
        }
                
        if indexRow == cellIndexCheckFlightHours {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Часы чекфлайта:")
            
            return cell
        }
        
        if indexRow == cellIndexAerodromOpportunityLabel {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerLabelCell", for: indexPath) as! OwnerLabelCell
            cell.commonInit(text: "Возможность подлета на эродромы:")
        
        return cell

        }
        
        if indexRow == cellIndexCheckAerodromOpportunityYes {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath) as! CheckCell
            cell.commonInit(text: "Да")
            
            
            return cell
        }
        
        if indexRow == cellIndexCheckAerodromOpportunityNo {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath) as! CheckCell
            cell.commonInit(text: "Нет")
            
            return cell
        }
                
        if indexRow == cellIndexMinHoursForPodlet {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.commonInit(placeHolder: "Минимум часов для аренды полета:")
            
            return cell
        }
        
        if indexRow == cellIndexDoneButton {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddImageCell", for: indexPath) as! AddImageCell
            
            return cell
        }

        return UITableViewCell()
    }
}
