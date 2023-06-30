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
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: CharacterCellViewModel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    private func fetchImage(with url: String ) {
        guard let imageURL = URL(string: url) else { return }
        characterImageView.fetchImage(with: imageURL)
    }
    
}

extension CharacterTableViewCell: CharacterCellViewModelDelegate {
    
    func configureCell(with character: Attributes) {
        characterDescriptionLabel.text = character.description
        characterNameLabel.text = character.canonicalName
        fetchImage(with: character.imageDictionary.original)
    }
}
