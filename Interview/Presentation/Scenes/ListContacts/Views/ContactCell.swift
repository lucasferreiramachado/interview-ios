import UIKit

class ContactCell: UITableViewCell {
    lazy var contactImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()

    lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    func configureViews() {
        contentView.addSubview(contactImage)
        contentView.addSubview(fullnameLabel)

        contactImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        contactImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

        fullnameLabel.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 16).isActive = true
        fullnameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        fullnameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        fullnameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

extension ContactCell {
    func bindViewModel(viewModel: ContactCellViewModelInput) {
        fullnameLabel.text = viewModel.name
        viewModel.setOutput(output: self)
        viewModel.loadImage()
    }
}

extension ContactCell: ContactViewModelOutput {
    func setPhotoImage(image: UIImage?) {
        contactImage.image = image
    }
}
