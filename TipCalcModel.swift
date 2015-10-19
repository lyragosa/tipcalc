//
//  TipCalcModel.swift
//  TipCalc
//
//  Created by Lyragosa on 15/10/19.
//  Copyright © 2015年 Lyragosa. All rights reserved.
//

import Foundation

class test {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    
    init(total:Double,taxPct:Double) {
        self.total=total
        self.taxPct=taxPct
        //subtotal = total / (taxPct + 1)
    }
    
    func calc(tipPct:Double) -> Double {
        return subtotal * tipPct
    }
    
    /*
    func printpt() {
    let tmpinf = [0.15, 0.18, 0.2, 0.5]
    
    for posstip in tmpinf {
    print("\(posstip*100)%:  \(calc(posstip))")
    
    }
    
    /*for i in 0...tmpinf.count {
    let p2s = tmpinf[i]
    print("\(p2s*100)%: 123123  \(calc(p2s)) kakaka  sdfsdfds")
    }*/
    
    //let tmpexp:Double = [0.15, 0.18, 0.2]
    
    /*print("15%: \(self.calc(0.15))")
    print("18%: \(self.calc(0.18))")
    print("20%: \(self.calc(0.20))")*/
    }
    
    */
    
    // 1
    func returnPossibleTips() -> Dictionary<Int, Double>    {
        
        let tmptip = [0.15,0.18,0.20]
        
        var retval = Dictionary<Int, Double>()
        for postip in tmptip {
            let intpct = Int(postip*100)
            retval[intpct]=calc(postip)
        }
        return retval
    }
    
    let pertip = [0.15,0.18,0.2]
    
    
    
    
    
}



