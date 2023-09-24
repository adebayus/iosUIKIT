//
//  DetailTrxViewController.swift
//  AssignmentTask
//
//  Created by mymac on 24/09/23.
//

import UIKit

class DetailTrxViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var transactionCollectionView: UICollectionView!
    var presenter: DetailTrxViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        headerLabel.text = presenter?.title ?? ""
        // Do any additional setup after loading the view.
    }
    
    func initCollectionView() {
        transactionCollectionView.delegate = self
        transactionCollectionView.dataSource = self
        let nib = UINib(nibName: "DetailTrxCell", bundle: nil)
        transactionCollectionView.register(nib, forCellWithReuseIdentifier: "DetailTrxCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.listTrx.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let data = presenter?.listTrx[indexPath.row] {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailTrxCell", for: indexPath) as! DetailTrxCell
            cell.dateLabel.text = data.trx_date
            cell.priceLabel.text = data.nominal.formatToIDRCurrency()
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
}
