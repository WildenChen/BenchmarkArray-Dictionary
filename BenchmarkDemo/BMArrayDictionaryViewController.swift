//
//  BenchmarkViewController.swift
//  Benchmark_Dictionary_Array
//
//  Created by Wilden on 2017/5/17.
//  Copyright © 2017年 Wilden. All rights reserved.
//

import UIKit

class BMArrayDictionaryViewController: UIViewController {
    private let mButtonA    :UIButton   = UIButton()
    private let mButtonB    :UIButton   = UIButton()
    private var mArrLabel   :UILabel    = UILabel()
    private var mDicLabel   :UILabel    = UILabel()
    
    private var mArray  :[String]       = [String]()
    private var mDic    :[Int:String]   = [Int:String]()
    
    private let sMAX:Int = 100000
    private var mArrTimes:[Double] = [Double]()
    private var mDicTimes:[Double] = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        for _index in 0..<sMAX {
            mArray.append("\(_index)")
            mDic.updateValue("\(_index)", forKey: _index)
        }
        
        mArrLabel.frame = CGRect(x: 10, y: 50, width: self.view.bounds.width - 20, height: 50)
        mArrLabel.layer.borderWidth = 1
        self.view.addSubview(mArrLabel)
        
        mDicLabel.frame = CGRect(x: 10, y: 110, width: self.view.bounds.width - 20, height: 50)
        mDicLabel.layer.borderWidth = 1
        self.view.addSubview(mDicLabel)
        
        
        let _width:CGFloat = (self.view.bounds.width - 30.0) / 2.0
        mButtonA.frame = CGRect(x: 10, y: 200, width: _width, height: 60)
        mButtonA.setTitle("Array", for: UIControlState.normal)
        mButtonA.addTarget(self, action: #selector(onArrayTapHandler), for: UIControlEvents.touchUpInside)
        mButtonA.backgroundColor = UIColor.red
        self.view.addSubview(mButtonA)
        
        mButtonB.frame = CGRect(x: 10 + _width + 10, y: 200, width: _width, height: 60)
        mButtonB.setTitle("Dictionary", for: UIControlState.normal)
        mButtonB.addTarget(self, action: #selector(onDictionaryTapHandler), for: UIControlEvents.touchUpInside)
        mButtonB.backgroundColor = UIColor.brown
        self.view.addSubview(mButtonB)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc private func onArrayTapHandler(){
        let _random:Int = Int(arc4random()) % sMAX
        let _startTime:Date = Date()
        
        for _ in 0..<sMAX {
            let _:String = mArray[_random]
        }
        
        let _endTime:Date = Date()
        
        let _betweenTime = _endTime.timeIntervalSince1970 - _startTime.timeIntervalSince1970
        mArrTimes.append(_betweenTime)
        
        mArrLabel.text = "Array,\(calculateAdvanceTimes(mArrTimes))"
    }
    
    @objc private func onDictionaryTapHandler(){
        let _random:Int = Int(arc4random()) % sMAX
        let _startTime:Date = Date()
        
        for _ in 0..<sMAX {
            let _:String = mDic[_random]!
        }
        
        let _endTime:Date = Date()
        
        let _betweenTime = _endTime.timeIntervalSince1970 - _startTime.timeIntervalSince1970
        mDicTimes.append(_betweenTime)
        
        mDicLabel.text = "Dictionary,\(calculateAdvanceTimes(mDicTimes))"
    }
    
    private func calculateAdvanceTimes(_ aTimes:[Double]) -> Double{
        var _result:Double = 0.0
        for _value in aTimes {
            _result = _result + _value
        }
        return (aTimes.count == 0) ? _result : _result / Double(aTimes.count)
    }
}
