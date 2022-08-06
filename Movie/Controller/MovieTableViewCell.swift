//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/6/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func onBind(data:Result){
        lblTitle.text = data.title
        lblDate.text = data.releaseDate
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w500\(data.posterPath)")!)){
            (data, req, error) in
            
            do{
                let datas = try data
                DispatchQueue.main.async {
                    self.img.image = UIImage(data: datas!)
                    
                }
            }catch{
                print("Error")
            }
        }.resume()
    }
}
