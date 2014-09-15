//
//  ViewController.swift
//  LemonadeTycoon
//
//  Created by Vic Zhou on 15/09/2014.
//  Copyright (c) 2014 SaviumStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var lemonLabel: UILabel!
    @IBOutlet weak var iceLabel: UILabel!
    @IBOutlet weak var buyLemonLabel: UILabel!
    @IBOutlet weak var buyIceLabel: UILabel!
    @IBOutlet weak var mixLemonLabel: UILabel!
    @IBOutlet weak var mixIceLabel: UILabel!

    var money:Int = 10
    var lemon:Int = 1
    var ice:Int = 1
    var buyLemon:Int = 0
    var buyIce:Int = 0
    var mixLemon:Int = 0
    var mixIce:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.moneyLabel.text = "\(self.money)"
        self.lemonLabel.text = "\(self.lemon)"
        self.iceLabel.text = "\(self.ice)"
        
    }
    @IBAction func addBuyLemonButtonPressed(sender: AnyObject) {
        self.buyLemonLabel.text = "\(++self.buyLemon)"
    }
    @IBAction func subBuyLemonButtonPressed(sender: AnyObject) {
        self.buyLemonLabel.text = "\(--self.buyLemon)"
    }
    @IBAction func addBuyIceButtonPressed(sender: AnyObject) {
        self.buyIceLabel.text = "\(++self.buyIce)"
    }
    @IBAction func subBuyIceButtonPressed(sender: AnyObject) {
        self.buyIceLabel.text = "\(--self.buyIce)"
    }
    @IBAction func addMixLemonButtonPressed(sender: AnyObject) {
        self.mixLemonLabel.text = "\(++self.mixLemon)"
    }
    @IBAction func subMixLemonButtonPressed(sender: AnyObject) {
        self.mixLemonLabel.text = "\(--self.mixLemon)"
    }
    @IBAction func addMixIceButtonPressed(sender: AnyObject) {
        self.mixIceLabel.text = "\(++self.mixIce)"
    }
    @IBAction func subMixIceButtonPressed(sender: AnyObject) {
        self.mixIceLabel.text = "\(--self.mixIce)"
    }
    @IBAction func startButtonPressed(sender: AnyObject) {
        self.resetUI()
    }
    func resetUI() {
        self.buyLemon = 0
        self.buyIce = 0
        self.mixLemon = 0
        self.mixIce = 0
        
        self.buyLemonLabel.text = "\(self.buyLemon)"
        self.buyIceLabel.text = "\(self.buyIce)"
        self.mixLemonLabel.text = "\(self.mixLemon)"
        self.mixIceLabel.text = "\(self.mixIce)"
    }

}

