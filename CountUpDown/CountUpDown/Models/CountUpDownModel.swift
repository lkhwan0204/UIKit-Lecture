//
//  CountUpDownModel.swift
//  CountUpDown
//
//  Created by kyuhyeon Lee on 3/11/25.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 0      //구조체 생성 후 Int타입 Count 생성
    
    mutating func increaseCount() {
        self.count += 1     //count 변수를 1 증가
    }
    
    mutating func decreaseCount() {
        self.count -= 1     // count 변수를 1 감소
    }
}

