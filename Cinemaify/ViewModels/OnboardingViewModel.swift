//
//  OnboardingViewModel.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import Foundation

final class OnboardingViewModel {
    
    let sliderData: [OnboardingItemModel] = [
        
        .init(color: Constants.OnboardingPageOne.color,
              title: Constants.OnboardingPageOne.title,
              text: Constants.OnboardingPageOne.text,
              animationName: Constants.OnboardingPageOne.animationName) ,
        
            .init(color: Constants.OnboardingPageTwo.color,
                  title: Constants.OnboardingPageTwo.title,
                  text: Constants.OnboardingPageTwo.text,
                  animationName: Constants.OnboardingPageTwo.animationName) ,
        
            .init(color: Constants.OnboardingPageThree.color,
                  title: Constants.OnboardingPageThree.title,
                  text: Constants.OnboardingPageThree.text,
                  animationName: Constants.OnboardingPageThree.animationName)
    ]
}
