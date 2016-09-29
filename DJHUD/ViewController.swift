//
//  ViewController.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var types: [DJHUDType] = [.Success, .Error, .Progress, .NineDots, .TriplePulse,
                                      .FiveDots, .RotatingSquare, .DoubleBounce, .BallPulse, .BallRotateClip,
                                      .BallClipRotatePulse, .BallRotateMultiple, .BallRotate]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = types[indexPath.row].description
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        HUD.flash(types[indexPath.row])
        
    }
    
}

