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


extension MovieListViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieList.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(indexPath.row). \(MovieList.movies[indexPath.row].name ?? "")"
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            tableView.beginUpdates()
            MovieList.movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movie = MovieList.movies[sourceIndexPath.row]
        MovieList.movies.remove(at: sourceIndexPath.row)
        MovieList.movies.insert(movie, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}
