import UIKit

class StuTableViewCell: UITableViewCell {
    
    var stuModel = StuModel()
    
    
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var sNoLabel: UILabel!
    @IBOutlet weak var sNameLabel: UILabel!
    @IBOutlet weak var sAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setStuModelData(_ stuModel: StuModel){
        photoImage.image = stuModel.photo
        sNoLabel.text = "\(String(describing: stuModel.no))"
        sNameLabel.text = stuModel.name
        sAgeLabel.text = "\(String(describing: stuModel.age))"
    }
}
