//
//  ViewController.swift
//  iis
//
//  Created by Ivan Zhurauski on 11/26/19.
//  Copyright © 2019 Ivan Zhurauski. All rights reserved.
//

import UIKit

struct Stack {
     var items: [String] = []
    
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
    
    func isEmpty() -> Bool{
        if items.count == 0 {
            return true
        }
        else {
            return false
        }
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    

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
                [ "if": ["years of foundation" : "<1890",
                           "color" : "blue"],
                   "then": [
                "number of championship cups" : "0"
                   ]],
                [ "if": ["years of foundation" : "1890+",
                                          "color" : "blue"],
                                  "then": [
                               "number of championship cups" : "1+"
                                  ]],
                [ "if": ["years of foundation" : "1890+",
                           "color" : "blue-white"],
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
    var context = [Any]()
    var conditionsToknow = [String]()
    var answersToKnow = [String]()
    var categoryPicker = UIPickerView()
    var usedRules = [Int]()
    var count = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCategoryTextField()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        self.categoryPicker.backgroundColor = .white

        targets.push("club")
        start()
        self.setupTextlabel()
    }
    
    func setupTextlabel(){
        let string = self.conditionsToknow[count]
        self.textLabel.text = "What is yourth " + string
    }
    
    
    func setupCategoryTextField() {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem.init(title: "done", style: .plain, target: self, action: #selector(pickerViewDone))
        let space = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem.init(title: "cancel", style: .plain, target: self, action: #selector(pickerViewCancel))
        toolbar.items = [cancelButton, space, doneButton]
        self.textField.inputView = categoryPicker
        self.textField.inputAccessoryView = toolbar
        toolbar.sizeToFit()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if count != -1{
        let condition = self.conditionsToknow[count]
        let answers = self.attributes[condition]!
        return answers.count
        }
        else{
         return 0
        }
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
        let atribute = self.conditionsToknow[count]
        if let answers = self.attributes[atribute]{
            return answers[row]
        }
        else{
           return ""
        }
       }
    
    
    @objc func pickerViewDone() {
        let atribute = self.conditionsToknow[count]
               if let answers = self.attributes[atribute]{
                let row = self.categoryPicker.selectedRow(inComponent: 0)
                self.textField.text = answers[row]
               }
       
        self.textField.resignFirstResponder()
        
    }

    @objc func pickerViewCancel() {
        self.textField.resignFirstResponder()
    }
    
    func start(){
      
        let a = getconditions(i: 8)
        self.conditionsToknow =  checkThen(conditions: a)
        let aaa = "fwefwf"
    }
    
    
    func getconditions(i:Int) -> [String]{
        let rule = rules[i]
        let ifconditions = rule["if"]
        var curentconditions = [String]()
        for (key,_) in ifconditions!{
            curentconditions.append(key)
        }
        
        return curentconditions
    }
    
    func checkThen(conditions:[String])->[String]{
        var answer = conditions
        var useConditions = Set<String>()
        for condition in conditions {
            for rule in self.rules{
                if  let thenRule = rule["then"]{
                    for (key,_) in thenRule{
                        if (condition == key){
                            useConditions.insert(key)
                            answer += self.getconditions(i: self.rules.firstIndex(of: rule)!)
                        }
                }
            }
        }
    }
        for cond in useConditions{
            targets.push(cond)
        }
        let setConditions = Set(answer)
        let substracking = setConditions.subtracting(useConditions)
    return Array(substracking)
    }
    
    @IBAction func OkButtonTapped(_ sender: Any) {
        if self.count == -1 {
             self.textField.text = ""
            self.count = 0
            self.answersToKnow.removeAll()
            self.conditionsToknow.removeAll()
            self.OKbutton.setTitle("OK", for: .normal)
            self.start()
            self.setupTextlabel()
            return
        }
        
        if (self.count < 2 ){
        self.OKbutton.setTitle("OK", for: .normal)
        self.count += 1
        self.setupTextlabel()
        self.answersToKnow.append(self.textField.text!)
        self.textField.text = ""
        }
        else{
             self.answersToKnow.append(self.textField.text!)
             self.textField.text = ""
            self.count = -1
            self.OKbutton.setTitle("Repeat", for: .normal)
            self.textLabel.text = ""
            checkRules()
            for world in self.answersToKnow {
                print(world)
            }
        }
        
        
        
    }
    
    func checkRules(){
        for target in self.targets.items{
            for rule in self.rules{
                if let thenCondition = rule["then"]{
                    for (kkey,vvalue ) in thenCondition{
                        if kkey == target{
                if let ifConditions = rule["if"]{
                    var aaa = Set<String>()
                    var bbb = Set<String>()
                    for (key,value) in ifConditions{
                        aaa.insert(key)
                        bbb.insert(value)
                    }
                    let conditionsToKnowSet = Set(self.conditionsToknow)
                    if aaa.subtracting(conditionsToKnowSet).count == 0 && bbb.subtracting(answersToKnow).count == 0{
                    
                    let newCondition =    self.targets.pop()
                        let indexRule = self.rules.firstIndex(of: rule) ?? -1
                        self.usedRules.append(indexRule)
                    let newAnswer = vvalue
                        self.answersToKnow.append(newAnswer)
                        self.conditionsToknow.append(newCondition)
                        checkRules()
                        if self.targets.items.count == 0{
                            self.textLabel.text = "your club is " + self.answersToKnow.last!
                            print(self.usedRules)
                        }
                        return
                    }
                }
                        }
                    }
                }
            }
        }
         self.textLabel.text = "cant find yourth club"
         print(self.usedRules)
    }
 

}
