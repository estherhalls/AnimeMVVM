//
//  CharacterListTableViewController.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import UIKit

class CharacterListTableViewController: UITableViewController {

    var viewModel: CharacterListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CharacterListViewModel(injectedDelegate: self)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characterList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        let selectedCharacter = viewModel.characterList[indexPath.row]
        cell.viewModel = CharacterCellViewModel(listResult: selectedCharacter, injectedDelegate: cell)
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CharacterListTableViewController: CharacterListViewModelDelegate {
    func characterListFetchedSuccessfully() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
