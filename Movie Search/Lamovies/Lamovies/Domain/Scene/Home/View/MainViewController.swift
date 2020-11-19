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
    let defaultMovies = ["Batman", "Fight Club", "Breaking Bad", "Inception", "Lord Of The Ring", "How High"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTypeTextField.inputView = movieTypePicker
        movieTypePicker.delegate = self
        
        searchButton.layer.cornerRadius = 5
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        moviePickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        moviePickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        movieTypeTextField.text = moviePickerData[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        if movieTitleTextField.text?.isEmpty == true {
            showSearchHelpMessage()
        } else {
            self.performSegue(withIdentifier: "segue_to_list", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if
            segue.identifier == "segue_to_list",
            let destinationVC = segue.destination as? MovieListViewController
        {
            if let title = movieTitleTextField.text, !title.isEmpty {
                destinationVC.movieTitle = title
            }
            
            if let year = movieYearTextField.text, !year.isEmpty {
                destinationVC.movieYear = year
            }

            if let type = movieTypeTextField.text, !type.isEmpty {
                destinationVC.movieType = type
            }
        }
    }
    
    func showSearchHelpMessage() {
        let randomIndex = Int(arc4random_uniform(UInt32(defaultMovies.count)))
        
        let alertViewController = UIAlertController(
            title: NSLocalizedString("popup_title", comment: ""),
            message: NSLocalizedString("popup_message", comment: ""),
            preferredStyle: .alert
        )
        
        let confirmButtonAction = UIAlertAction(
            title: NSLocalizedString("popup_button", comment: ""),
            style: .default
        ) {
            [weak self] _ in
            self?.movieTitleTextField.text = self?.defaultMovies[randomIndex]
            self?.performSegue(withIdentifier: "segue_to_list", sender: self)
        }
        
        alertViewController.addAction(confirmButtonAction)
        
        present(alertViewController, animated: true, completion: nil)
    }
}
