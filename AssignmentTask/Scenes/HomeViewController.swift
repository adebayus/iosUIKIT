//
//  HomeViewController.swift
//  AssignmentTask
//
//  Created by mymac on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rekeningLabel: UILabel!
    @IBOutlet weak var saldoLabel: UILabel!
    
    private var user = UserDefaults.standard.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUser()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setUser() {
        guard let _ = user else {
            user = User.user
            return
        }
    }
    
    private func setupUI() {
        nameLabel.text = user?.name ?? "-"
        rekeningLabel.text = user?.name ?? "-"
        saldoLabel.text = user?.saldo.formatToIDRCurrency()
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
