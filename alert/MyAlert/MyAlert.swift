//
//  MyAlert.swift
//  alert
//
//  Created by iMac on 08/08/2019.
//  Copyright © 2019 yuosaf01. All rights reserved.
//

import UIKit

public class MyAlert: UIView {
    
    private var myViewAlert = UIView()
    private var myViewAlertBackground = UIView()
    private var myViewAlertStyle = UIView()
    private var myActivityAlert = UIActivityIndicatorView()
    private var mySizeView:CGSize?
    private var myColor:UIColor = #colorLiteral(red: 0.1939046637, green: 0.1939046637, blue: 0.1939046637, alpha: 1)

    public enum Status {
        case dark
        case light
    }

    init(Show:Bool,status : Status? = .dark) {
        
        let frame = UIApplication.shared.keyWindow?.bounds.size
        
        mySizeView = frame
        
        super.init(frame: CGRect(x: 0, y: 0 , width: frame!.width, height: frame!.height))
      
        switch status {
        case .dark?:

            myColor = #colorLiteral(red: 0.1939046637, green: 0.1939046637, blue: 0.1939046637, alpha: 1)

        case .light?:

            myColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)

        case .none:
            myColor = #colorLiteral(red: 0.1939046637, green: 0.1939046637, blue: 0.1939046637, alpha: 1)
        }

        switch Show {
        case true:
            show()
        case false:
            MyAlert.hide()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    @discardableResult public static func view(Show:Bool,status : Status? = .dark) -> MyAlert {
        let alert = MyAlert(Show:Show,status: status)
        return alert
    }

    func show() {

        myViewAlert.backgroundColor = .none

        myViewAlertStyle = UIView(frame: CGRect(x: ((mySizeView!.width / 2) - 37.5), y: ((mySizeView!.height / 2) - 37.5), width: 75, height: 75))
        myViewAlertStyle.backgroundColor = myColor
        myViewAlertStyle.layer.cornerRadius = 8

        myActivityAlert = UIActivityIndicatorView(style: .white)
        myActivityAlert.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        myActivityAlert.startAnimating()
      
        myViewAlertBackground = UIView(frame: CGRect(x: 0, y: 0, width: mySizeView!.width, height: mySizeView!.height))
        myViewAlertBackground.backgroundColor = .black
        myViewAlertBackground.alpha = 0.3

        myViewAlertStyle.addSubview(myActivityAlert)
        myViewAlert.addSubview(myViewAlertStyle)
        myViewAlert.addSubview(myViewAlertBackground)
        addSubview(myViewAlert)

        UIApplication.shared.keyWindow?.addSubview(self)

    }
    
    func hideAlert() {

        UIView.transition(with: self, duration: 0.3, options: [.transitionCrossDissolve ,.curveEaseInOut,.beginFromCurrentState]
            , animations: {
                self.alpha = 0
        }) { (B) in
            self.removeFromSuperview()
        }
    }
    
    public static func hide(){
        for vim in UIApplication.shared.keyWindow!.subviews {
            if let alert = vim as? MyAlert {
                alert.hideAlert()
            }
        }
    }

}
