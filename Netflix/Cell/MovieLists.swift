//
//  MovieLists.swift
//  Netflix
//
//  Created by THEINPYAE PHYO on 5/12/22.
//

import UIKit

class MovieLists: UITableViewCell {

    @IBOutlet var lblCategories: UILabel!
    @IBOutlet var cvMovieLists: UICollectionView!
    
    static let identifier = "MovieLists"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cvMovieLists.register(UINib(nibName: MovieImage.identifier, bundle: nil), forCellWithReuseIdentifier: MovieImage.identifier)
        cvMovieLists.delegate = self
        cvMovieLists.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MovieLists: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieImage.identifier, for: indexPath) as! MovieImage
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 70)
    }
}
