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

    var money = 10
    var lemon = 1
    var ice = 1
    var buyLemon = 0
    var buyIce = 0
    var mixLemon = 0
    var mixIce = 0
    let priceLemon = 2
    let priceIce = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateInventory()
        
    }
    @IBAction func addBuyLemonButtonPressed(sender: AnyObject) {
        if money >= priceLemon{
            buyLemonLabel.text = "\(++buyLemon)"
            money -= priceLemon
            lemon++
            updateInventory()
        }
    }
    @IBAction func subBuyLemonButtonPressed(sender: AnyObject) {
        if buyLemon > 0{
            buyLemonLabel.text = "\(--buyLemon)"
            money += priceLemon
            lemon--
            updateInventory()
        }
    }
    @IBAction func addBuyIceButtonPressed(sender: AnyObject) {
        if money >= priceIce{
            buyIceLabel.text = "\(++buyIce)"
            money -= priceIce
            ice++
            updateInventory()
        }
    }
    @IBAction func subBuyIceButtonPressed(sender: AnyObject) {
        if buyIce > 0{
            buyIceLabel.text = "\(--buyIce)"
            money += priceIce
            ice--
            updateInventory()
        }
    }
    @IBAction func addMixLemonButtonPressed(sender: AnyObject) {
        mixLemonLabel.text = "\(++mixLemon)"
    }
    @IBAction func subMixLemonButtonPressed(sender: AnyObject) {
        if mixLemon > 0 {
            mixLemonLabel.text = "\(--mixLemon)"
        }
    }
    @IBAction func addMixIceButtonPressed(sender: AnyObject) {
        mixIceLabel.text = "\(++mixIce)"
    }
    @IBAction func subMixIceButtonPressed(sender: AnyObject) {
        if mixIce > 0 {
            mixIceLabel.text = "\(--mixIce)"
        }
    }
    @IBAction func startButtonPressed(sender: AnyObject) {
        updateInventory()
        resetUI()
    }
    func resetUI() {
        buyLemon = 0
        buyIce = 0
        mixLemon = 0
        mixIce = 0
        
        buyLemonLabel.text = "\(buyLemon)"
        buyIceLabel.text = "\(buyIce)"
        mixLemonLabel.text = "\(mixLemon)"
        mixIceLabel.text = "\(mixIce)"
    }
    func updateInventory() {
        moneyLabel.text = "$\(money) Cash"
        lemonLabel.text = "\(lemon) Lemons"
        iceLabel.text = "\(ice) Ice Cubes"
    }

}

