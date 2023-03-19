// by geee3, March 16, 2023

import UIKit

/*
 데이터 타입 기본
 
 데이터 타입은 프로그램 내에서 다뤄지는 데이터의 종류를 뜻합니다. 차후에 문법을 더 많이
 익히면 알겠지만, Swift의 기본 데이터 타입은 구조체를 타입의 기반으로 삼아 Swift의
 다양한 기능(익스텐션, 제네릭 등)을 두루 사용하여 구현되어 있습니다. 그중 가장 주목해야
 할 점은 Swift의 기본 데이터 타입이 모두 구조체를 기반으로 구현되어 있다는 것입니다.
 Swift의 모든 데이터 타입 이름은 첫 글자가 대문자로 시작하는 대문자 카멜케이스를 사용
 합니다.
 */

/*
 Int와 UInt
 
 정수 타입입니다. Int는 +, - 부호를 포함한 정수를 뜻하며 이 중 - 부호를 포함하지 않는
 0을 포함한 양의 정수는 UInt로 표현합니다. Int와 UInt 타입의 최댓값과 최솟값은 각각 max
 와 min 프로퍼티로 알아볼 수 있습니다. Int와 UInt는 각각 8비트, 16비트, 32비트, 64비트
 의 형태가 있습니다. 시스템 아키텍처에 따라 Int와 UInt 타입이 달라집니다. 32비트 아키텍처
 에서는 Int32가 Int 타입으로, UInt32가 UInt 타입으로 지정됩니다. 그리고 64비트 아키텍
 처에서는 Int64가 Int 타입으로, UInt64가 UInt 타입으로 지정됩니다.
 */

var integer: Int = -100
let unsigned: UInt = 50
print("integer 값: \(integer), unsigned integer 값: \(unsigned)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")

/*
 다음은 각 진수에 따라 정수를 표현하는 방법입니다.
 - 10진수: 평소에 쓰던 숫자와 동일하게 작성합니다.
 - 2진수: 접두어 0b를 사용하여 표현합니다.
 - 8진수: 접두어 0o를 사용하여 표현합니다.
 - 16진수: 접두어 0x를 사용하여 표현합니다.
 */

let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100
let octalInteger: Int = 0o34
let hexadecimalInteger: Int = 0x1C

/*
 Bool
 
 Bool은 불리언 타입입니다. 불리언 타입은 참(true) 또는 거짓(false)만 값으로 가집니다.
 */

var boolean: Bool = true
boolean.toggle()
print("시간은 무한합니까?: \(boolean)")
