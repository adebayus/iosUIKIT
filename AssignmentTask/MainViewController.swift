//
//  MainViewController.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = HomeViewController()
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case 1:
            break
        case 2:
            let vc = PortofolioRouter.createModule()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
             break
        default:
            break
        }
    }

}
