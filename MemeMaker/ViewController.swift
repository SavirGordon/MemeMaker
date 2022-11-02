//
//  ViewController.swift
//  MemeMaker
//
//  Created by 4d on 11/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topSegmentedControl: UISegmentedControl!
    @IBOutlet var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet var topCaptionLabel: UILabel!
    @IBOutlet var bottomCaptionLabel: UILabel!
    
    @IBAction func China(_ sender: Any) {
        updateLabels()
    }
    
    var topChoices: [CaptionOption] = [CaptionOption(emoji: "🤖", caption: "When I come from china"), CaptionOption(emoji: "💩", caption: "When I go to Iran"), CaptionOption(emoji: "💀", caption: "When I live in Africa")]
    var bottomChoices: [CaptionOption] = [CaptionOption(emoji: "🤡", caption: "Then I died"), CaptionOption(emoji: "🫃🏿", caption: "Ended up pregnant"), CaptionOption(emoji: "👨🏿‍🦯", caption: "I turned blind")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topSegmentedControl.removeAllSegments()
        
        for choice in topChoices {topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false) }
        topSegmentedControl.selectedSegmentIndex = 0
    }
    
    func updateLabels(){
        let topSelectedIndex = topSegmentedControl.selectedSegmentIndex
        let bottomSelectedIndex = bottomSegmentedControl.selectedSegmentIndex
        
        topCaptionLabel.text = topChoices[topSelectedIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomSelectedIndex].caption
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}

