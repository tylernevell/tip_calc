//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tyler Nevell on 5/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipPct: Double?
    var numberOfPeople: Int?
    var result: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // amount owed by each person
        totalLabel.text = result
        
        settingsLabel.text = "Split between " + String(numberOfPeople ?? 2) + " people, with " + String(format: "%.0f", (tipPct! * 100)) + "% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
