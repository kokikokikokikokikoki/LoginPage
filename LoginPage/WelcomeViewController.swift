//
//  signUpViewController.swift
//  LoginPage
//
//  Created by Buratsakorn Petchdee on 3/2/2565 BE.
//

import UIKit

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = tableView.dequeueReusableCell(withIdentifier: "identifier", for : indexPath)
        return identifier
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageProf: UIImageView!
    
    @IBOutlet weak var cameraProf: UIImageView!
    @IBOutlet weak var borderProf: UIView!
  
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderProf.layer.cornerRadius = borderProf.frame.size.width / 2
        borderProf.clipsToBounds = true
        borderProf.layer.borderColor = UIColor.white.cgColor
        borderProf.layer.borderWidth = 3
        cameraProf.layer.cornerRadius = cameraProf.frame.size.width / 2
        cameraProf.clipsToBounds = true
        cameraProf.layer.backgroundColor = UIColor.gray.cgColor
        
        TableView.delegate = self
        TableView.dataSource = self
        
        //        imageProf.layer.cornerRadius = imageProf.frame.size.width / 2
//        imageProf.clipsToBounds = true
//        imageProf.layer.borderColor = UIColor.white.cgColor
//        imageProf.layer.borderWidth = 3
    
    }
   

    
    @IBAction func onClickBack(_ sender: Any) {
      self.navigationController?.popViewController(animated: true)
       // self.dismiss(animated: true, completion: nil)
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
