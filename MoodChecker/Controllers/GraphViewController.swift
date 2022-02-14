//
//  GraphViewController.swift
//  MoodChecker
//
//  Created by Benedict Velasco on 2/02/22.
//

import UIKit
import AAInfographics

class GraphViewController: UIViewController {
    
    let weekData = UserDefaults.standard.object(forKey: "moodKey") as? [String: Int] ?? [:]
    //let weekData = userMoods.shared.users
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let chartViewWidth  = self.view.frame.size.width
        let chartViewHeight = self.view.frame.size.height
        let aaChartView = AAChartView()

        aaChartView.frame = CGRect(x:0, y:0, width:chartViewWidth, height:chartViewHeight)
        // set the content height of aachartView
        // aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView)

        let aaChartModel = AAChartModel()
                    .yAxisLabelsEnabled(false)
                    .yAxisMax(6)
                    .chartType(.line)   //Can be any of the chart types listed under `AAChartType`.
                    .animationType(.bounce)
                    .title("Weekly Mood Progress") //The chart title
                 // .subtitle("subtitle")   //The chart subtitle
                 // .tooltipValueSuffix("Mood")//the value suffix of the chart tooltip
                    .categories(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
                                 "Sun"])
                    .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
                    .series([
                        AASeriesElement()
                            .name("Mood")
                            .data([
                                weekData["Monday"], weekData["Tuesday"], weekData["Wednesday"], weekData["Thursday"], weekData["Friday"], weekData["Saturday"], weekData["Sunday"]]),
                            ])

        //The chart view object calls the instance object of AAChartModel and draws the final graphic
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
    }

}
