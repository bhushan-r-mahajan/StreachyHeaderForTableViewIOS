//
//  StreachingHeader.swift
//  StreachingHeader
//
//  Created by Gadgetzone on 02/08/21.
//

import UIKit

class StreachingHeader: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let containerView = UIView()

    var imageHeightConstraint = NSLayoutConstraint()
    var imageBottomConstraint = NSLayoutConstraint()
    var imagewidhtConstraint = NSLayoutConstraint()
    var containerViewHeightConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.backgroundColor = .cyan
        containerView.addSubview(imageView)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        containerViewHeightConstraint.isActive = true
        
        imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 150)
        imageHeightConstraint.isActive = true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeightConstraint.constant = scrollView.contentInset.top
        let offset = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offset <= 0
        imageBottomConstraint.constant = offset >= 0 ? 0 : -offset / 2
        imageHeightConstraint.constant = max(offset + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
