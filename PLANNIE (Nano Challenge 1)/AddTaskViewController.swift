//
//  AddTaskViewController.swift
//  PLANNIE (Nano Challenge 1)
//
//  Created by Joana Handoyo on 27/04/22.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
    performSegue(withIdentifier: "createToHome", sender: self)
    }
    
    // Date Picker //
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    @IBOutlet weak var dateTF: UITextField!
    
    let defaults = UserDefaults.standard
    
    let datePicker = UIDatePicker ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()

    // Time Picker - Start //
        let time = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "hh:mm a"
        startTimeButton.text = formatter.string(from: time)
        startTimeButton.textColor = .black
                
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        timePicker.frame.size = CGSize(width: 0, height: 250)
        startTimeButton.inputView = timePicker
    
    // Time Picker - End //
        let time1 = Date()
        let formatter1 = DateFormatter()
        formatter1.locale = Locale(identifier: "en_gb")
        formatter1.dateFormat = "hh:mm a"
        endTimeButton.text = formatter.string(from: time)
        endTimeButton.textColor = .black
                    
        let timePicker1 = UIDatePicker()
        timePicker1.datePickerMode = .date
        timePicker1.addTarget(self, action: #selector(timePickerValueChanged1(sender:)), for: UIControl.Event.valueChanged)
        timePicker1.frame.size = CGSize(width: 0, height: 250)
        endTimeButton.inputView = timePicker1
    }
    
    // Date Picker //
    func createToolbar() -> UIToolbar {
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }

    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateTF.inputView = datePicker
        dateTF.inputAccessoryView = createToolbar()
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_gb")
//        formatter2.dateFormat = "hh:mm a"
        dateTF.text = dateFormatter.string(from: date)
        dateTF.textColor = .black
        

    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_gb")
        dateTF.text = dateFormatter.string(from: datePicker.date)
        
        
//        self.dateTF.text = "\(datePicker.date)"
        self.view.endEditing(true)
  
    }

    // Start Time Picker //
    @IBOutlet weak var startTimeButton: UITextField!

    
    @objc func timePickerValueChanged(sender: UIDatePicker)
    {
        // when time is changed it will appear here //
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "h:mm a"
        startTimeButton.text = formatter.string(from: sender.date)
    }
    
    // End Time Picker //
    @IBOutlet weak var endTimeButton: UITextField!
    
    @objc func timePickerValueChanged1(sender: UIDatePicker)
    {
        // when time is changed it will appear here //
        let formatter1 = DateFormatter()
        formatter1.locale = Locale(identifier: "en-gb")
        formatter1.dateFormat = "h:mm a"
        endTimeButton.text = formatter1.string(from: sender.date)
    }
    
    
    @IBOutlet weak var createButton: UIButton!
    @IBAction func createButton(_ sender: Any) {
        defaults.set(nameTextField.text, forKey: "name")
        defaults.set(descTextField.text, forKey: "desc")
        defaults.set(dateTF.text, forKey: "date")
        defaults.set(startTimeButton.text, forKey: "start time")
        print(defaults.string(forKey: "name"))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
