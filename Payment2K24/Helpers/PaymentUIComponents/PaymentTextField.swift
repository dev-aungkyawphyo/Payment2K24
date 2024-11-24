//
//  PaymentTextField.swift
//  Payment2K24
//
//  Created by Aung Kyaw Phyo on 21/11/2024.
//

import Foundation
import UIKit

@IBDesignable
class PaymentTextField: UITextField {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0
    
    @IBInspectable
    var leftImage: UIImage? {
        didSet {
            if let leftImage {
                addImage(image: leftImage)
                return
            }
            leftViewMode = .never
        }
    }
    
    @IBInspectable
    var addVisible: Bool = false {
        didSet {
            if addVisible {
                addVisibleBtn()
                return
            }
        }
    }
    
    @IBInspectable
    var leftPadding: CGFloat = 0
    
    @IBInspectable
    var rightPadding: CGFloat = 0
    
    @IBInspectable
    var color: UIColor = UIColor.lightGray {
        didSet {
            // Update color
        }
    }
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    // Provides right padding for images
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setUnderLine()
    }
    
    private func addVisibleBtn() {
        let visibleBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        visibleBtn.setImage(UIImage(named: "close-eye-icon"), for: .selected)
        visibleBtn.imageView?.tintColor = .appColor(.primaryTextColor)
        visibleBtn.setImage(UIImage(named: "open-eye-icon"), for: .normal)
        visibleBtn.isSelected = true
        isSecureTextEntry = visibleBtn.isSelected
        visibleBtn.addTarget(self, action: #selector(visibleBtnAction(_:)), for: .touchUpInside)
        rightViewMode = .always
        rightView = visibleBtn
    }
    
    @objc private func visibleBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = sender.isSelected
    }
    
    private func addImage(image: UIImage) {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        container.addSubview(imageView)
        container.center = imageView.center
        imageView.image = image
        leftViewMode = .always
        leftView = container
    }
    
    private func configure() {
        setUnderLine()
        borderStyle = .none
        layer.borderColor = UIColor.clear.cgColor
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder!: "",
                                                   attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}
