//
//  SetDetailsVC.swift
//  Knotive
//
//  Created by Muhammad Riaz on 07/01/2021.
//

import UIKit

class SetDetailsVC: UIViewController {
    
    var isMale: Bool = true
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        maleBtn.layer.backgroundColor = UIColor.black.cgColor
        maleBtn.layer.cornerRadius = 8
        maleBtn.setTitleColor(.white, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func goToMainAppAction(_ sender: UIButton) {
        let router = WindowRouter()
        router.showMainApp()
    }
    
    @IBAction func maleSelectionAction(_ sender: UIButton) {
        
        isMale = true
        
        maleBtn.layer.backgroundColor = UIColor.black.cgColor
        maleBtn.layer.cornerRadius = 8
        maleBtn.setTitleColor(.white, for: .normal)
        
        femaleBtn.layer.backgroundColor = UIColor.white.cgColor
        femaleBtn.layer.cornerRadius = 8
        femaleBtn.setTitleColor(.lightGray, for: .normal)
    }
    
    @IBAction func femaleSelectionAction(_ sender: UIButton) {
        
        isMale = false
        
        femaleBtn.layer.backgroundColor = UIColor.black.cgColor
        femaleBtn.layer.cornerRadius = 8
        femaleBtn.setTitleColor(.white, for: .normal)
        
        maleBtn.layer.backgroundColor = UIColor.white.cgColor
        maleBtn.layer.cornerRadius = 8
        maleBtn.setTitleColor(.lightGray, for: .normal)
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
