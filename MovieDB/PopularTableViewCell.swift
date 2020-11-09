//
//  PopularTableViewCell.swift
//  MovieDB
//
//  Created by Milan Chalishajarwala on 11/4/20.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    
    @IBOutlet var movieName: UILabel!
    @IBOutlet var relDate: UILabel!
    
    @IBOutlet var duration: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func popularMoviesNib() -> UINib{
        return UINib(nibName: "PopularTableViewCell", bundle: nil)
    }
    
    func configureCell(posterPath: String, movie_name: String, rel_date: String){
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")
        guard let imageUrl = url else { return }
//        self.movieName.text = movie_name
//        self.relDate.text = rel_date
        DispatchQueue.global(qos: .userInitiated).async{
           

            do{
                let data = try Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                
                    self.imgView.image = UIImage(data: data)
                }
            } catch {
                print("Data cannot be fetched")
            }
        }
    }
    
}
