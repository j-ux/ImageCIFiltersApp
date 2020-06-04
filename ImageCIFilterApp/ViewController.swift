//
//  ViewController.swift
//  ImageCIFilterApp
//
//  Created by Jeffrey Osa on 2020-06-04.
//  Copyright © 2020 Jeffrey Osa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var BlurRadius: UISlider!
    var defaultImg: UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultImg = ImgView.image
    }


    @IBAction func SliderValue(_ sender: UISlider) {
        
    }
    
    @IBAction func ApplyFilterBtn(_ sender: UIButton) {
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputRadiusKey:BlurRadius.value]
        ApplyFilters(filterName:"CIBoxBlur", filterParams:filterParams)
        
    }
    
    
    @IBAction func PhotoFadeBtn(_ sender: UIButton) {
       
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName:"CIPhotoEffectFade", filterParams:filterParams)
    }
    
    
    @IBAction func ComicEffectBtn(_ sender: UIButton) {
       var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        
        ApplyFilters(filterName:"CIComicEffect", filterParams:filterParams)
        
    }
    
    
    @IBAction func SepiaToneBtn(_ sender: UIButton) {
        
        var rawImg = CIImage(image: ImgView.image!)
                      var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputIntensityKey:BlurRadius.value]
                      ApplyFilters(filterName:"CISepiaTone", filterParams:filterParams)
    }
    
    
    @IBAction func MotionBlurBtn(_ sender: UIButton) {
     
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputAngleKey:BlurRadius.value,kCIInputRadiusKey:BlurRadius.value]
        ApplyFilters(filterName:"CIMotionBlur", filterParams:filterParams)
    }
    
    
    @IBAction func HueAdjustBtn(_ sender: UIButton) {
       
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg,kCIInputAngleKey:BlurRadius.value]
        ApplyFilters(filterName:"CIHueAdjust", filterParams:filterParams)
        
    }
    
    
    @IBAction func ResetImg(_ sender: UIButton) {
        
        ImgView.image = defaultImg
    }
    
    func ApplyFilters(filterName:String, filterParams:[String:Any]){
    var filter = CIFilter(name:filterName, parameters: filterParams)
    let context = CIContext(options:nil)
    
    if let output = filter?.outputImage{
        if var cgiResult = context.createCGImage(output, from: output.extent){
            ImgView.image = UIImage(cgImage: cgiResult)
        }
        
     }
        
  }
        


}
