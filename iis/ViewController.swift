//
//  ViewController.swift
//  iis
//
//  Created by Ivan Zhurauski on 11/26/19.
//  Copyright © 2019 Ivan Zhurauski. All rights reserved.
//

import UIKit

struct Stack {
    private var items: [String] = []
    
    func peek() -> String {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    mutating func pop() -> String {
        return items.removeFirst()
    }
  
    mutating func push(_ element: String) {
        items.insert(element, at: 0)
    }
}

class ViewController: UIViewController {

    var attributes = ["city": ["London","Liverpool","Manchester","other"],
                      "color":["white","red","blue","blue-white"],
                      "years of foundation":[ "<1890","1890+"],
                      "number of championship cups":["0","1+"],
                      "club":["Manchester United","Blackburn Rovers","Arsenal","Chelsea","Manchester City",
                      "Leicester City","Tottenham Hotspur","Everton","Liverpool","West Ham United","Stoke City",
                      "Swansea City"]
    ]
    var rules = [["if":["city" : "Manchester"],
                    "then": ["number of championship cups" : "1+"]],
                 
                ["if": [ "years of foundation": "1890+",
                            "color": "red"],
                "then": [
                    "number of championship cups":"0"]],
                
                [ "if": ["years of foundation" : "1890+",
                           "color" : "blue"],
                   "then": [
                "number of championship cups" : "1+"
                   ]],
                
                [ "if": [
                    "color": "white",
                    "years of foundation" : "<1890"],
                    "then": ["number of championship cups": "0"]],
                
                [ "if": [
                      "number of championship cups": "1+",
                       "color": "red",
                        "city": "Manchester"],
                   "then": [
                  "club": "Manchester United"
                   ]],
                [ "if": [
                    "number of championship cups": "1+",
                     "color": "red",
                      "city": "London"],
                 "then": [
                "club": "Arsenal"
                 ]],
                [ "if": [
                    "number of championship cups": "1+",
                     "color": "blue",
                      "city": "London"],
                 "then": [
                "club": "Chelsea"
                 ]],
                [ "if": [
                    "number of championship cups": "1+",
                     "color": "blue",
                      "city": "other"],
                 "then": [
                "club": "Leicester city"
                 ]],
                [ "if": [
                    "number of championship cups": "1+",
                     "color": "blue-white",
                      "city": "other"],
                 "then": [
                "club": "Blackburn Rovers"
                 ]],
                [ "if": [
                    "number of championship cups": "1+",
                     "color": "blue-white",
                      "city": "Manchester"],
                 "then": [
                "club": "Manchester City"
                 ]],
                [ "if": [
                    "number of championship cups": "0",
                     "color": "white",
                      "city": "London"],
                 "then": [
                "club": "Tottenham Hotspur"
                 ]],
                [ "if": [
                    "number of championship cups": "0",
                     "color": "other",
                      "city": "London"],
                 "then": [
                "club": "WestHam United"
                 ]],
                [ "if": [
                    "number of championship cups": "0",
                     "color": "red",
                      "city": "Liverpool"],
                 "then": [
                "club": "Liverpool"
                 ]],
                [ "if": [
                    "number of championship cups": "0",
                     "color": "blue",
                      "city": "Liverpool"],
                 "then": [
                "club": "Everton"
                 ]],
                [ "if": [
                    "number of championship cups": "0",
                     "color": "white",
                      "city": "other"],
                 "then": [
                "club": "Swansea City"
                 ]],
                [ "if": [
                    "number of championship cups": "0",
                     "color": "red",
                      "city": "other"],
                 "then": [
                "club": "Stoke City"
                 ]]
    ]
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var OKbutton: UIButton!
    var targets = Stack()
    var rulesStack = Stack()
    var contextStack = Stack()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func start(){
        while (true) {
            var targets = Stack()
            
        }
    }
    
    
    
    
    
    
    }



