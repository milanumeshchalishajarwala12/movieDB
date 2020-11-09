//
//  NowShowingMovieCollectionViewCell.swift
//  MovieDB
//
//  Created by Milan Chalishajarwala on 11/4/20.
//

import UIKit

class NowShowingMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func NowShowingNib() -> UINib{
        return UINib(nibName: "NowShowingMovieCollectionViewCell", bundle: nil)
    }
    
    func configureCell(posterPath: String){
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")
        guard let imageUrl = url else { return }
        DispatchQueue.global(qos: .userInitiated).async{
        do{
            let data = try Data(contentsOf: imageUrl)
            DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
            }
        }catch{
            print("Data cannot be fetched")
        }
        }
    }

}
