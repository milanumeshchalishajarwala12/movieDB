//
//  ViewController.swift
//  MovieDB
//
//  Created by Milan Chalishajarwala on 11/4/20.
//

import UIKit

class ViewController: UIViewController {
    var nowShowingMovies: [Result] = []
    var mostPopularMovies: [Result] = []

    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var tblView: UITableView!
    
    let apiHandler = APIHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(NowShowingMovieCollectionViewCell().NowShowingNib(), forCellWithReuseIdentifier: "NowShowingMovieCollectionViewCell")
        apiHandler.fetchData(type: MovieModel.self, contentType: "now_playing")
        apiHandler.fetchData(type: MovieModel.self, contentType: "popular")

        apiHandler.closure = {
            (data, response, error) in
            let moviesArray = data as! MovieModel
            guard let array = moviesArray.results else { return }
            DispatchQueue.global().async {
                self.nowShowingMovies.append(contentsOf: array)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowShowingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowShowingMovieCollectionViewCell", for: indexPath) as! NowShowingMovieCollectionViewCell
        cell.configureCell(posterPath: nowShowingMovies[indexPath.row].poster_path ?? "")
        return cell
    }
    
    
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.34, height: collectionView.frame.height)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostPopularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell")
    }
    
    
}
