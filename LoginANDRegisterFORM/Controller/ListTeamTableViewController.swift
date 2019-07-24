//
//  ListTeamTableViewController.swift
//  LoginANDRegisterFORM
//
//  Created by Sopheap Sopheadavid on 7/23/19.
//  Copyright © 2019 Sopheap Sopheadavid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListTeamTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    let URL = "https://api.sportsdata.io/v3/soccer/scores/json/Teams?key=99464b503a7c476dbd6e6cf8fb449a49"
   
    var soccer = Soccer()
    var soccers : [[String: Any]] = [[String: Any]]()
    
    
    @IBOutlet var teamTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamTableView.dataSource = self
        teamTableView.delegate = self
        loadData()
        setupTableView()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soccers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
        let eachRow = soccers[indexPath.row]
        cell.labelName.text = eachRow["Name"] as? String
        cell.labelFullName.text = eachRow["FullName"] as? String
        cell.labelAreaName.text = eachRow["AreaName"] as? String
        cell.labelCityName.text = eachRow["City"] as? String
        
        
        if let url = NSURL(string: eachRow["WikipediaLogoUrl"] as? String ?? "") {
            let data = try? Data(contentsOf: url as URL)
            if let data = data {
                let image = UIImage(data: data)
                cell.avatarImageView.image = image
            }
        }
        return cell
    }
    private func setupTableView() {
        tableView.rowHeight = 200.0
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let eachRow = soccers[indexPath.row]
        vc.name = eachRow["Name"] as? String ?? "Not have an email"
        vc.fullName = eachRow["FullName"] as? String ?? "Not have an email"
        vc.areName = eachRow["AreaName"] as? String ?? "Not have an email"
        vc.venueName = eachRow["VenueName"] as? String ?? "Not have an email"
        vc.email = eachRow["Email"] as? String ?? "Not have an email"
        vc.website = eachRow["Website"] as? String ?? "Not have an email"
        vc.globalID = eachRow["GlobalTeamId"] as? Int ?? 0
        if let url = NSURL(string: eachRow["WikipediaLogoUrl"] as? String ?? "") {
            let data = try? Data(contentsOf: url as URL)
            if let data = data {
                let imageView = UIImage(data: data)
                vc.image = imageView ?? UIImage(named: "ball")!
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Download Data
    func loadData() {
        Alamofire.request(URL, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success! Got the Team Soccers data")
                if let teamJSON = response.result.value as! [[String:Any]]? {
                    self.soccers = teamJSON
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    //Retreive data
//    func retreiveData(json: JSON) {
//        soccer.name = json[0]["Name"].stringValue
//        soccer.fullName = json[0]["FullName"].stringValue
//        soccer.area = json[0]["AreaName"].stringValue
//        soccer.city = json[0]["City"].stringValue
//        soccer.imageView = json[0]["WikipediaLogoUrl"].stringValue
//
//        print(soccer.name)
//    }
//
  
}
