//
//  CharacterTableViewCell.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: ServiceRequestingImageView!
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
    
    private func fetchCharacter(with link: String){
        
    }
    
    private func fetchImage(with url: String ) {
        guard let imageURL = URL(string: url) else { return }
        characterImageView.fetchImage(with: imageURL)
    }
    
}

extension CharacterTableViewCell {
    func configureCell(with character: Attributes) {
        characterNameLabel.text = character.canonicalName
        fetchImage(with: character.imageDictionary.medium)
    }
}
