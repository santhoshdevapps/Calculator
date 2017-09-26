/*
 * File Name : ViewController.swift
 * Name : Santhosh Damodharan
 * Date : 2017-09-23
 * StudentID : 300964037
 * Description : Simple calculator which performs basic opertions
 * Version : 1.0 - Built operation flow
*/
 import UIKit

class ViewController: UIViewController {


    // VARIABLES +++++++++++++++++++++++++++
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    var results : Double = 0;


    // OUTLETS ++++++++++++++++++++++++++++++
    
    @IBOutlet weak var displayLabel: UILabel!
 

    // ACTIONS AND METHODS
    
    /*!
     * @discussion It is used to get the user input as number and display in displayLabel
     */
 
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            displayLabel.text = String (sender.tag)
            numberOnScreen = Double(displayLabel.text!)!
            print(numberOnScreen)
            performingMath = false
        }
        else
        {
            if displayLabel.text == "0" {
                // stops the user for entering multiple zero's as first digit
                displayLabel.text = String(sender.tag)
                numberOnScreen = Double(displayLabel.text!)!
            }
            else
            {
                
            displayLabel.text = displayLabel.text! + String(sender.tag)
            numberOnScreen = Double(displayLabel.text!)!
            // print(numberOnScreen)
            }
        }
    }

    /*!
     * @discussion It is used to get the user input as decimal point and display in displayLabel
     */

    @IBAction func decimal(_ sender: UIButton) {
       
            displayLabel.text = displayLabel.text! + String(".")
            numberOnScreen = Double(displayLabel.text!)!
        
    }
    
    /*!
     * @discussion It is used to perform mathematical operations such as Addition, subtraction, division, multiplication.
     */

    @IBAction func operations(_ sender: UIButton)
    {
    if displayLabel.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(displayLabel.text!)!
            operation = sender.tag
            performingMath = true;
            
            if operation == 19  // Percentage
            {
                results = (previousNumber/100)
                displayLabel.text = String (results)
            }
            else if operation == 18  //Square root
            {
                results =  sqrt(previousNumber)
                displayLabel.text = String ((results))
            }
    }
        else if sender.tag == 16
        {
            if operation == 12  // Divide
            {
                results = previousNumber / numberOnScreen
                displayLabel.text = String (results)
            }
            else if operation == 13 // Multiply
            {
                 results = previousNumber * numberOnScreen
                 displayLabel.text = String (results)
            }
            else if operation == 14  // Minus
            {
                results = previousNumber - numberOnScreen
                displayLabel.text = String (results)

            }
            else if operation == 15   // Plus
            {
                results = previousNumber + numberOnScreen
                displayLabel.text = String (results)
            }
        }
    }
    
    /*!
     * @discussion It resets the displayLabel to Zero
     */
    @IBAction func cancelButton(_ sender: UIButton) {
        displayLabel.text = "0"
        previousNumber = 0;
        numberOnScreen = 0;
        operation = 0;

    }
    
    // INHERITED METHODS +++++++++++++++++++++++++++++++
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

}

