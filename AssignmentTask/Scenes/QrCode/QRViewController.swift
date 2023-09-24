//
//  QRViewController.swift
//  AssignmentTask
//
//  Created by mymac on 21/09/23.
//

import UIKit
import VisionKit

class QRViewController: UIViewController {
    
    var scannerIsAvailable: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
    
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
    
    func setupDataScanner() {
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.text(), .barcode()])
    }
    
}
