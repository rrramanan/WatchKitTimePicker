//
//  InterfaceController.swift
//  TimePicker WatchKit Extension
//
//  Created by Vinod Ramanathan on 14/02/19.
//  Copyright © 2019 Vinod Ramanathan. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // #MARK: IBOutlet
    @IBOutlet weak var hourPicker: WKInterfacePicker!
    @IBOutlet weak var minutesPicker: WKInterfacePicker!
    @IBOutlet weak var ampmPicker: WKInterfacePicker!
    @IBOutlet weak var hourLabel: WKInterfaceLabel!
    @IBOutlet weak var minutesLabel: WKInterfaceLabel!
    @IBOutlet weak var ampmLabel: WKInterfaceLabel!
    @IBOutlet weak var timeButton: WKInterfaceButton!
    
    // #MARK: Variable - Array
    var HoursArray: Array<Any> = []
    var HoursLoadArray: Array<Any> = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var HoursFormatArray: Array<Any> = ["01","02","03","04","05","06","07","08","09","10","11","12"]
    var MinutesArray: Array<Any> = []
    var MinutesLoadArray: Array<Any> =                 ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52", "53","54","55","56","57","58","59"]
    var ampmArray: Array<Any> = []
    var ampmLoadArray: Array<Any> = ["AM","PM"]
   
    // #MARK: Variable - Strings
    var hh = ""
    var mm = ""
    var ampm = ""
    var totalTime = ""
    var gethh = "01"
    var getmm = "00"
    var getampm = "AM"
    
    // #MARK: awake - withContext
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        for (id,_) in HoursLoadArray.enumerated(){
            let pickerItem = WKPickerItem()
            pickerItem.title = HoursLoadArray[id] as? String
            HoursArray.append(pickerItem)
        }
        
        for (id,_) in MinutesLoadArray.enumerated(){
            let pickerItem = WKPickerItem()
            pickerItem.title = MinutesLoadArray[id] as? String
            MinutesArray.append(pickerItem)
        }
        
        for (id,_) in ampmLoadArray.enumerated(){
            let pickerItem = WKPickerItem()
            pickerItem.title = ampmLoadArray[id] as? String
            ampmArray.append(pickerItem)
        }
        
        hourPicker.setItems(HoursArray as? [WKPickerItem])
        minutesPicker.setItems(MinutesArray as? [WKPickerItem])
        ampmPicker.setItems(ampmArray as? [WKPickerItem])
        
        let date = Date()
        let formatter = DateFormatter()
        

        formatter.dateFormat = "hh"
        hh = formatter.string(from: date)
        
        formatter.dateFormat = "mm"
        mm = formatter.string(from: date)
        
        formatter.dateFormat = "a"
        ampm = formatter.string(from: date)
        
        
        for (id,_) in HoursLoadArray.enumerated(){

            if (hh == HoursFormatArray[id] as? String){

                if id == 0{
                    hourLabel.setText("01")
                }

                hourPicker.setSelectedItemIndex(id)
            }

        }

        for (id,_) in MinutesLoadArray.enumerated(){

            if (mm == MinutesLoadArray[id] as? String){

                if id == 0{
                    minutesLabel.setText("00")
                }

                minutesPicker.setSelectedItemIndex(id)
            }

        }

        for (id,_) in ampmLoadArray.enumerated(){

            if (ampm == ampmLoadArray[id] as? String){

                if id == 0{
                    ampmLabel.setText("AM")
                }

                ampmPicker.setSelectedItemIndex(id)
            }

        }
        
        
        totalTime = "\(hh):\(mm) \(ampm)"
        
        timeButton.setTitle(totalTime)
        
        
    }
    
    
    // #MARK:  willActivate
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    // #MARK:  didDeactivate
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // #MARK: Actions - Picker and Button
    
    @IBAction func hour(_ value: Int) {
        
        hourLabel.setText(HoursFormatArray[value] as? String)
        
        gethh = HoursFormatArray[value] as! String
        
        totalTime = "\(gethh):\(getmm) \(getampm)"
        
        timeButton.setTitle(totalTime)
    }

    @IBAction func minutes(_ value: Int) {
        
        let minutes = MinutesArray[value] as! WKPickerItem
        
        minutesLabel.setText(minutes.title)
        
        getmm = minutes.title!
        
        totalTime = "\(gethh):\(getmm) \(getampm)"
        
        timeButton.setTitle(totalTime)
        
    }

    @IBAction func ampm(_ value: Int) {
        
        let ampm = ampmArray[value] as! WKPickerItem
        
        ampmLabel.setText(ampm.title)
        
        getampm = ampm.title!
        
        totalTime = "\(gethh):\(getmm) \(getampm)"
        
        timeButton.setTitle(totalTime)
        
    }

    @IBAction func timebuttonAction() {
        print("totalTime ",totalTime)
    }
    

}
