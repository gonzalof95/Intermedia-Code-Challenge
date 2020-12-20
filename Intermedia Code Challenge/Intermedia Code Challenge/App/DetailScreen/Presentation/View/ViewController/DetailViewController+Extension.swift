//
//  DetailViewController+Extension.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsArray.count + 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier) as! ImageTableViewCell
            let imageurl = heroData.thumbnail.path + "." + heroData.thumbnail.imageExtension
            cell.configure(with: imageurl)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier) as! DescriptionTableViewCell
            cell.configure(with: heroData.description)
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as! TitleTableViewCell
            cell.configure(with: TitleConstants.detailScreenTitle)
            return cell	
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ComicTableViewCell.identifier) as! ComicTableViewCell
            cell.configure(with: comicsArray[indexPath.row - 3].name, subtitle: "1990")
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
