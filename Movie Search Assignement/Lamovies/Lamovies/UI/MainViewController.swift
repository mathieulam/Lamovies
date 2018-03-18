//
//  ViewController.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var movieTitleTextField: UITextField!
    @IBOutlet weak var movieYearTextField: UITextField!
    @IBOutlet weak var movieTypeTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    let movieTypePicker = UIPickerView()
    let moviePickerData = [String](arrayLiteral: "movie", "series", "episode")
    //in case of empty fields
    let array = ["Batman", "Fight Club", "Breaking Bad", "Inception", "Lord Of The Ring", "How High", "The Fault In Our Stars", "Get Out", "Star Wars", "Logan"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTypeTextField.inputView = movieTypePicker
        movieTypePicker.delegate = self
        
        searchButton.layer.cornerRadius = 5
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moviePickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return moviePickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        movieTypeTextField.text = moviePickerData[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        if movieTitleTextField.text!.isEmpty {
            showSearchHelpMessage()
        } else {
            self.performSegue(withIdentifier: "segue_to_list", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_to_list" {
            let destinationVC = segue.destination as! MovieListViewController
            
            
                if movieTitleTextField.text != nil && !movieTitleTextField.text!.isEmpty {
                    destinationVC.movieTitle = movieTitleTextField.text!
                }
                if movieYearTextField.text != nil && !movieYearTextField.text!.isEmpty {
                    destinationVC.movieYear = movieYearTextField.text!
                }
                if movieTypeTextField.text != nil && !movieTypeTextField.text!.isEmpty {
                    destinationVC.movieType = movieTypeTextField.text!
                }
        }
    }
    
    func showSearchHelpMessage() {
        let action = UIAlertAction.self
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        
        let alertViewController = UIAlertController(title: NSLocalizedString("popup_title", comment: ""), message: NSLocalizedString("popup_message", comment: ""), preferredStyle: .alert)
        
        let confirmButtonAction = action.init(title: NSLocalizedString("popup_button", comment: ""), style: .default) { (action) -> Void in
            self.movieTitleTextField.text = self.array[randomIndex]
            self.performSegue(withIdentifier: "segue_to_list", sender: self)
        }
        
        alertViewController.addAction(confirmButtonAction)
        
        present(alertViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

