//
//  ViewController.swift
//  TableView-Assignment
//
//  Created by Kunwar Vats on 17/03/22.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeMovies()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editTapped))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Movies"
        tableView.reloadData()
    }
    
    func initializeMovies()
    {
        MovieList.movies = [Movie(name: "Eternals"), Movie(name: "Dune"), Movie(name: "No Time To Die"), Movie(name: "Last Night in Soho"), Movie(name: "Ron's Done Wrong"), Movie(name: "Halloween Kills"), Movie(name: "Venome"), Movie(name: "Antlers"), Movie(name: "The Addams Family 2")]
        tableView.reloadData()
    }

    @objc func addTapped()
    {
        guard let addMovie = self.storyboard?.instantiateViewController(withIdentifier: "AddMovieViewController") as? AddMovieViewController else { return }
        self.navigationController?.pushViewController(addMovie, animated: true)
    }
    
    @objc func editTapped()
    {
        tableView.isEditing = !tableView.isEditing
    }
}


