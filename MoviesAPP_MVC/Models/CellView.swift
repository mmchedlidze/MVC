//
//  CellView.swift
//  MoviesAPP_MVC
//
//  Created by Mariam Mchedlidze on 18.11.23.
//

import UIKit

final class MovieItemCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .red
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    let topButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let titleGenreStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - CellLifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()

        movieImageView.image = nil
        titleLabel.text = nil
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }

    // MARK: - Private Methods
    private func addSubview() {
        addSubview(movieImageView)
        addSubview(topButtonStackView)
        addSubview(titleGenreStackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        NSLayoutConstraint.activate([
            topButtonStackView.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 8),
            topButtonStackView.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 8),
            topButtonStackView.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -8)
        ])
//
        NSLayoutConstraint.activate([
            titleGenreStackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            titleGenreStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleGenreStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
//
        let topRightButton = createTopButton()
        topButtonStackView.addArrangedSubview(favoriteButton)
        topButtonStackView.addArrangedSubview(topRightButton)
    }
}
