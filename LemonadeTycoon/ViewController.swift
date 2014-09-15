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

    //inventory vars
    var money = 10
    var lemon = 1
    var ice = 1
    
    //day transaction vars
    var buyLemon = 0
    var buyIce = 0
    var mixLemon = 0
    var mixIce = 0
    
    //price constants
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
        if lemon > 0 {
            mixLemonLabel.text = "\(++mixLemon)"
            lemon--
            updateInventory()
        }
    }
    @IBAction func subMixLemonButtonPressed(sender: AnyObject) {
        if mixLemon > 0 {
            mixLemonLabel.text = "\(--mixLemon)"
            lemon++
            updateInventory()
        }
    }
    @IBAction func addMixIceButtonPressed(sender: AnyObject) {
        if ice > 0 {
            mixIceLabel.text = "\(++mixIce)"
            ice--
            updateInventory()
        }
    }
    @IBAction func subMixIceButtonPressed(sender: AnyObject) {
        if mixIce > 0 {
            mixIceLabel.text = "\(--mixIce)"
            ice++
            updateInventory()
        }
    }
    @IBAction func startButtonPressed(sender: AnyObject) {
        startTheDay()
        resetUI()
        updateInventory()
    }
    func startTheDay() {
        let customerNumber = Int(arc4random_uniform(UInt32(10)))
        var customers:[customer] = []
        var profitToday = 0
        
        for var i=0 ; i<customerNumber ; ++i {
            var thisCustomer = customer()
            customers += [thisCustomer]
            println("Customer #\(i) willBuy \(thisCustomer.willBuy) and buyWhat \(thisCustomer.buyWhat)")
        }
        
        for customer in customers {
            if customer.willBuy == 1 && customer.buyWhat == 1{
                if mixLemon > 0 {
                    profitToday += priceLemon * 2
                    mixLemon--
                }
            } else if customer.willBuy == 1 && customer.buyWhat == 0{
                if mixIce > 0 {
                    profitToday += priceIce * 2
                    mixIce--
                }
            }
        }
        
        money += profitToday
        showAlertWithText(header: "Nice!", message: "Today we had \(customerNumber) customer who bough $\(profitToday)")
    }
    func resetUI() {
        lemon += mixLemon
        ice += mixIce
        
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
    func showAlertWithText(header:String = "Header", message:String = "Message"){
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

