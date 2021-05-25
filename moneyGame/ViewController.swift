//
//  ViewController.swift
//  moneyGame
//
//  Created by 羅承志 on 2021/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dollImageView: UIImageView!
    @IBOutlet weak var dollPriceLabel: UILabel!
    
    @IBOutlet weak var dollSegmentedControl: UISegmentedControl!
    @IBOutlet weak var oneThousandLabel: UILabel!
    @IBOutlet weak var fiveHundredLabel: UILabel!
    @IBOutlet weak var oneHundredLabel: UILabel!
    @IBOutlet weak var fiftyLabel: UILabel!
    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    
    @IBOutlet weak var oneThousandStepper: UIStepper!
    @IBOutlet weak var fiveHundredStepper: UIStepper!
    @IBOutlet weak var oneHundredStepper: UIStepper!
    @IBOutlet weak var fiftyStepper: UIStepper!
    @IBOutlet weak var tenStepper: UIStepper!
    @IBOutlet weak var fiveStepper: UIStepper!
    @IBOutlet weak var oneStepper: UIStepper!
    
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    //抓出公仔圖片
    let tanjiroImage = UIImage(named: "00")
    let nidouziImage = UIImage(named: "01")
    let zenyiImage = UIImage(named: "02")
    //定義公仔價錢
    let tanjiroPrice = 5999
    let nidouziPrice = 5519
    let zenyiPrice = 6789
    //金額預設數量(取Stepper.value，文字轉數字用)
    var oneThousandNum:Int = 0
    var fiveHundredNum:Int = 0
    var oneHundredNum:Int = 0
    var fiftyNum:Int = 0
    var tenNum:Int = 0
    var fiveNum:Int = 0
    var oneNum:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //計算總和function
    func count() {
        let sum = oneThousandNum * 1000 + fiveHundredNum * 500 + oneHundredNum * 100 + fiftyNum * 50 + tenNum * 10 + fiveNum * 5 + oneNum * 1
        sumLabel.text = "\(sum)"
    }

    @IBAction func changeDoll(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            dollImageView.image = tanjiroImage
            dollPriceLabel.text = "\(tanjiroPrice)"
        } else if sender.selectedSegmentIndex == 1 {
            dollImageView.image = nidouziImage
            dollPriceLabel.text = "\(nidouziPrice)"
        } else if sender.selectedSegmentIndex == 2 {
            dollImageView.image = zenyiImage
            dollPriceLabel.text = "\(zenyiPrice)"
        }
    }
    
    @IBAction func changeQuantity(_ sender: UIStepper) {
        oneThousandNum = Int(oneThousandStepper.value)
        fiveHundredNum = Int(fiveHundredStepper.value)
        oneHundredNum = Int(oneHundredStepper.value)
        fiftyNum = Int(fiftyStepper.value)
        tenNum = Int(tenStepper.value)
        fiveNum = Int(fiveStepper.value)
        oneNum = Int(oneStepper.value)
        //將Stepper值，顯示於對應label中
        oneThousandLabel.text = "\(oneThousandNum)"
        fiveHundredLabel.text = "\(fiveHundredNum)"
        oneHundredLabel.text = "\(oneHundredNum)"
        fiftyLabel.text = "\(fiftyNum)"
        tenLabel.text = "\(tenNum)"
        fiveLabel.text = "\(fiveNum)"
        oneLabel.text = "\(oneNum)"
        
        count()
    }
    
    @IBAction func buy(_ sender: UIButton) {
        if dollSegmentedControl.selectedSegmentIndex == 0 {
            if sumLabel.text == "\(tanjiroPrice)" {
                discriptionLabel.text = "購買成功🥳🥳"
            } else if sumLabel.text! < "\(tanjiroPrice)" {
                discriptionLabel.text = "金額不足🙄🙄"
            } else if sumLabel.text! > "\(tanjiroPrice)" {
                discriptionLabel.text = "超過金額🥴🥴"
            }
        } else if dollSegmentedControl.selectedSegmentIndex == 1 {
            if sumLabel.text == "\(nidouziPrice)" {
                discriptionLabel.text = "購買成功🥳🥳"
            } else if sumLabel.text! < "\(nidouziPrice)" {
                discriptionLabel.text = "金額不足🙄🙄"
            } else if sumLabel.text! > "\(nidouziPrice)" {
                discriptionLabel.text = "超過金額🥴🥴"
            }
        } else if dollSegmentedControl.selectedSegmentIndex == 2 {
            if sumLabel.text == "\(zenyiPrice)" {
                discriptionLabel.text = "購買成功🥳🥳"
            } else if sumLabel.text! < "\(zenyiPrice)" {
                discriptionLabel.text = "金額不足🙄🙄"
            } else if sumLabel.text! > "\(zenyiPrice)" {
                discriptionLabel.text = "超過金額🥴🥴"
            }
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        dollSegmentedControl.selectedSegmentIndex = 0
        dollImageView.image = tanjiroImage
        dollPriceLabel.text = "\(tanjiroPrice)"
        oneThousandStepper.value = 0
        fiveHundredStepper.value = 0
        oneHundredStepper.value = 0
        fiftyStepper.value = 0
        tenStepper.value = 0
        fiveStepper.value = 0
        oneStepper.value = 0
        
        oneThousandLabel.text = "0"
        fiveHundredLabel.text = "0"
        oneHundredLabel.text = "0"
        fiftyLabel.text = "0"
        tenLabel.text = "0"
        fiveLabel.text = "0"
        oneLabel.text = "0"
        
        sumLabel.text = "0"
        discriptionLabel.text = ""
    }
}

