//
//  AddMoviewViewController.swift
//  TableView-Assignment
//
//  Created by Kunwar Vats on 17/03/22.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var movieTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Add Movie"
    }
    
    @IBAction func addMovieButtonAction(_ sender: Any) {
        
        if let movieName = movieTextField.text
        {
            if movieName.count == 0
            {
                errorLabel.isHidden = false
            }
            else
            {
                MovieList.movies.append(Movie(name: movieName))
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension AddMovieViewController: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool // return NO to not change text
    {
        errorLabel.isHidden = true
        return true
    }

}
