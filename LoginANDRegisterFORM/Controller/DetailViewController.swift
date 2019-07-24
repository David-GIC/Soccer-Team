//
//  DetailViewController.swift
//  LoginANDRegisterFORM
//
//  Created by Sopheap Sopheadavid on 7/24/19.
//  Copyright © 2019 Sopheap Sopheadavid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelNameDetail: UILabel!
    @IBOutlet weak var labelFullNameDetail: UILabel!
    @IBOutlet weak var labelAreaNameDetail: UILabel!
    @IBOutlet weak var labelVenueNameDetail: UILabel!
    @IBOutlet weak var labelEmailDetail: UILabel!
    @IBOutlet weak var labelWebsiteDetail: UILabel!
    @IBOutlet weak var labelGlobalIDDetail: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    
    var name = ""
    var fullName = ""
    var areName = ""
    var venueName = ""
    var email = ""
    var website = ""
    var globalID : Int = 0
    var image = UIImage(named: "ball")

   
    override func viewDidLoad() {
        super.viewDidLoad()

        labelNameDetail.text = name
        labelFullNameDetail.text = fullName
        labelAreaNameDetail.text = areName
        labelVenueNameDetail.text = venueName
        labelEmailDetail.text = email
        labelWebsiteDetail.text = website
        labelGlobalIDDetail.numberOfLines = globalID
        logoView.image = image
        
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
