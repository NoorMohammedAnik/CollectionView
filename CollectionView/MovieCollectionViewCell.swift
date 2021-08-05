//
//  MovieCollectionViewCell.swift
//  CollectionView
//
//  Created by Noor Mohammed Anik on 5/8/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    func setup (with movie: Movie){
        movieImageView.image = movie.image
        titleLbl.text = movie.title
    }
}
