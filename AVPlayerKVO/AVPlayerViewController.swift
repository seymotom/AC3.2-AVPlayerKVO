//
//  AVPlayerViewController.swift
//  AVPlayerKVO
//
//  Created by Tom Seymour on 1/28/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import SnapKit

let primaryColor: UIColor = UIColor(netHex: 0x2196F3)
let secondaryColor: UIColor = UIColor(netHex: 0xFFC107)

class AVPlayerViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        self.view.addSubview(videoContainer)
        self.view.addSubview(controllsContainer)
        self.controllsContainer.addSubview(loadedProgressView)
        self.controllsContainer.addSubview(positionSlider)
        self.controllsContainer.addSubview(currentTimeLabel)
        self.controllsContainer.addSubview(durationLabel)
    }
    
    func setUpConstraints() {
        videoContainer.snp.makeConstraints { (view) in
            view.leading.trailing.width.top.equalToSuperview()
            view.height.equalTo(videoContainer.frame.width * 0.5625)
        }
        controllsContainer.snp.makeConstraints { (view) in
            view.leading.trailing.equalToSuperview()
            view.top.equalTo(videoContainer.snp.bottom)
            view.height.equalTo(30)
        }
        
        
    }
    
    // MARK: - Lazy Properties
    
    internal lazy var videoContainer = UIView()
    
    internal lazy var controllsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    internal lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.font = UIFont.systemFont(ofSize: 10.0)
        return label
    }()
    
    internal lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.font = UIFont.systemFont(ofSize: 10.0)
        return label
    }()
    
    internal lazy var positionSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.0
        slider.maximumTrackTintColor = primaryColor
        return slider
    }()
    
    internal lazy var loadedProgressView: UIProgressView = {
        let view = UIProgressView()
        view.progress = 0
        view.backgroundColor = secondaryColor
        return view
    }()
    
    internal lazy var rateSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 2.0
        slider.value = 1.0
        slider.maximumTrackTintColor = primaryColor
        return slider
    }()
    
    internal lazy var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.5
        slider.maximumTrackTintColor = primaryColor
        return slider
    }()



}
