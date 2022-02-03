//
//  GraphViewController.swift
//  MoodChecker
//
//  Created by Benedict Velasco on 2/02/22.
//

import UIKit
import Charts

class GraphViewController: UIViewController, ChartViewDelegate {

    var lineGraph = LineChartView()
    let weekData = UserDefaults.standard.object(forKey: "ArrayKey") as? [String: Int] ?? [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lineGraph.delegate = self

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        lineGraph.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)

        lineGraph.center = view.center
        view.addSubview(lineGraph)
        
        var entries = [ChartDataEntry]()

        entries.append(ChartDataEntry(x: 0, y: Double(weekData["Monday"] ?? 0)))
        entries.append(ChartDataEntry(x: 1, y: Double(weekData["Tuesday"] ?? 0)))
        entries.append(ChartDataEntry(x: 2, y: Double(weekData["Wednesday"] ?? 0)))
        entries.append(ChartDataEntry(x: 3, y: Double(weekData["Thursday"] ?? 0)))
        entries.append(ChartDataEntry(x: 4, y: Double(weekData["Friday"] ?? 0)))
        entries.append(ChartDataEntry(x: 5, y: Double(weekData["Saturday"] ?? 0)))
        entries.append(ChartDataEntry(x: 6, y: Double(weekData["Sunday"] ?? 0)))

        
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineGraph.data = data
    }

}
