//
//  ViewController.swift
//  BenchmarkDemo
//
//  Created by Wilden on 2017/5/17.
//  Copyright © 2017年 Wilden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let mButton:UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        mButton.frame = CGRect(x: 10, y: self.view.bounds.height / 2, width: self.view.bounds.width - 20, height: 100)
        mButton.setTitle("Array & Dictionary", for: UIControlState.normal)
        mButton.addTarget(self, action: #selector(onBenchmarkArrayHandler), for: UIControlEvents.touchUpInside)
        mButton.backgroundColor = UIColor.red
        self.view.addSubview(mButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onBenchmarkArrayHandler(){
        let _benchmarkViewController:BMArrayDictionaryViewController = BMArrayDictionaryViewController()
        self.present(_benchmarkViewController, animated: true, completion: nil)
    }
}

