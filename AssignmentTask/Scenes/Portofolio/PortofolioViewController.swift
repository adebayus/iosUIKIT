//
//  PortofolioViewController.swift
//  AssignmentTask
//
//  Created by mymac on 22/09/23.
//

import UIKit
import DGCharts

class PortofolioViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var presenter: PortofolioViewToPresenterProtocol?
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var transactionCollectionView: UICollectionView!
    @IBOutlet weak var heightConstraintCollectionView: NSLayoutConstraint!
    
    var iosDataEntry = PieChartDataEntry(value: 40)
    var macOsDataEntry = PieChartDataEntry(value: 60)
    var numberOfDownloadsDataEntries: [PieChartDataEntry] = [
        .init(value: 20, label: "label 1"),
        .init(value: 80, label: "label 2")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.generateData()
        initChartSetup()
        initCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        transactionCollectionView.reloadData()
        transactionCollectionView.layoutIfNeeded()
        heightConstraintCollectionView.constant = transactionCollectionView.contentSize.height
    }
    
    func initChartSetup() {
        pieChartView.usePercentValuesEnabled = true
        pieChartView.drawCenterTextEnabled = false
        pieChartView.rotationEnabled = false
        pieChartView.highlightPerTapEnabled = false
        //        pieChartView.enable
    }
    
    func initCollectionView() {
        transactionCollectionView.delegate = self
        transactionCollectionView.dataSource = self
        transactionCollectionView.isScrollEnabled = false
        
        let nib = UINib(nibName: "TransactionCell", bundle: nil)
        transactionCollectionView.register(nib, forCellWithReuseIdentifier: "TransactionCell")
    }
    
    func updatePieChart() {
        print("tesss")
        if let data = presenter?.donutCharData {
            let set = PieChartDataSet(entries: data, label: "")
            set.sliceSpace = CGFloat(data.count)
            set.colors = ChartColorTemplates.pastel()
            
            let pieChartData = PieChartData(dataSet: set)
            
            let pFormatter = NumberFormatter()
            pFormatter.numberStyle = .percent
            pFormatter.maximumFractionDigits = 1
            pFormatter.multiplier = 1
            pFormatter.percentSymbol = " %"
            pieChartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
            pieChartData.setValueFont(.systemFont(ofSize: 11, weight: .light))
            pieChartData.setValueTextColor(.black)
            
            pieChartView.data = pieChartData
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.historyTransaction.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let data = presenter?.historyTransaction[indexPath.row] {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.transactionLabel.text = data.label
            return cell
        }
        
        
        
        // Configure cell with data[indexPath.item]
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let data = presenter?.historyTransaction[indexPath.row] {
            let vc = DetailTrxRouter.createModule(list: data.data, title: data.label)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
}


extension PortofolioViewController: PortofolioPresenterToViewProtocol {
    func setUpChart() {
        self.updatePieChart()
    }
    
}
