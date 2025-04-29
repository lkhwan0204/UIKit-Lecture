//1부터 100까지
//33부터 36 39 63 66 69 93 96 99
//일반숫자는 그냥 출력하고
import Foundation

//for i in 1...100 {
//    if i == 3 || i == 6 || i == 9 {
//        print("짝")
//    } else if i == 13 || i == 16 || i == 19{
//        print("짝")
//    } else if i == 23 || i == 26 || i == 29{
//        print("짝")
//    } else if i == 33 || i == 36 || i == 39{
//        print("짝짝")
//    } else if i == 43 || i == 46 || i == 49{
//        print("짝")
//    } else if i == 53 || i == 56 || i == 59{
//        print("짝")
//    } else if i == 63 || i == 66 || i == 69{
//        print("짝짝")
//    } else if i == 73 || i == 76 || i == 79{
//        print("짝")
//    } else if i == 83 || i == 86 || i == 89{
//        print("짝")
//    } else if i == 93 || i == 96 || i == 99{
//        print("짝짝")
//    } else {
//        print(i)
//    }
//}
//for i in 1 ... 100 {
//    if i == 3 || i == 6 || i == 9 || i == 13 || i == 16 || i == 19 || i == 23 || i == 26 || i == 29 || i == 43 || i == 46 || i == 49 || i == 53 || i == 56 || i == 59 || i == 73 || i == 76 || i == 79 || i == 83 || i == 86 || i == 89 {
//        print("짝")
//    } else if i == 33 || i == 36 || i == 39 || i == 63 || i == 66 || i == 69 || i == 93 || i == 96 || i == 99{
//        print("짝짝")
//    } else {
//        print(i)
//    }
//}

//    뒤에 숫자가 369면 되려나....???
//    33 36 39 같은 경우면 앞에도 나눠떨어져야하는데...
//    3의배수라고 해서 무조건369가 아니구나;;
//for i in 1 ... 100 {
//
//    let one = i % 10
//    let ten = i / 10
//    var clap = 0
//
//    if one == 3 || one == 6 || one == 9 {
//        clap += 1
//    }
//    if ten == 3 || ten == 6 || ten == 9 {
//        clap += 1
//    }
//    if clap == 1 {
//        print("짝")
//    } else if clap == 2 {
//        print("짝짝")
//    } else {
//        print(i)
//    }
//}
//369369369369
//      문자를 이어붙이자
//      문자열을 만들ㄹ어서 333639에만 짝짝을 넣어서




//for i in 1...5 {
//
//    var star = ""
//
//    for stars in 1...i {
//        star += "*"
//    }
//    print(star)
//}

//for i in 1...5 {
//    var star = ""
//
//    for stars in 1...i {
//        star += "*"
//    }
//    print(star)
//}
//for i in (1...4).reversed() {
//
//    var star = ""
//
//    for stars in 1...i {
//        star += "*"
//    }
//    print(star)
//}

// 별이 1~9까지 홀수개만 출력 1,3,5,7,9 그럼 홀수개 출력하고 .revered?
for i in 0...9 {
    var star = ""
    var space = ""

    if i % 2 == 1 {
        
        for spaces in 0...((9-i)/2) {
            space += " "
        }
        
        for stars in 1...i {
            star += "*"
        }
        print(space + star)
    }
}
for i in (0...7).reversed() {
    var star = ""
    var space = ""

    if i % 2 == 1 {
        
        for spaces in 0...((9-i)/2) {
            space += " "
        }
        
        for stars in 1...i {
            star += "*"
        }
        print(space + star)
    }
}
