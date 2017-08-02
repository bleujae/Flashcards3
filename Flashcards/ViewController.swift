//
//  ViewController.swift
//  Flashcards
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate  {

    @IBAction func FinalAnswerButton(_ sender: Any) {
    }
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var TextView: UITextView!
    
    @IBOutlet weak var AnswerLabel: UILabel!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        PickerView.dataSource = self
        PickerView.delegate = self
        
        setupCardUI()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCardUI() {
        TextView.text = CardCollection.instance.currentCard.question
        
        QuestionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
    }

    // Pickerview Data Source
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    // Pickerview delegates
    // returns text of option at a given row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row];
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        var alert : UIAlertController
        
        if CardCollection.instance.checkAnswer(PickerView.selectedRow(inComponent: 0)){
            // answer is correct
            alert = UIAlertController(title: "Correct", message: "Correct Answer!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Yay!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            // answer incorrect
            // expand to check finished code.
            alert = UIAlertController(title: "Incorrect", message: "Incorrect Answer.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Aww.", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
    
}
        
        CardCollection.instance.nextQuestion()
        
        setupCardUI()

}
}
