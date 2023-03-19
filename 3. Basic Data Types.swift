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

/*
 Float과 Double
 
 Float과 Double은 부동소수점을 사용하는 실수며 부동소수 타입이라고 합니다. 흔히 우리가
 말하는 소수점 자리가 있는 수입니다. 부동소수 타입은 정수 타입보다 훨씬 넓은 범위의 수를
 표현할 수 있습니다. Swift에는 64비트의 부동소수 표현을 하는 Double과 32비트의 부동
 소수 표현을 하는 Float이 있습니다.
 */

// Float이 수용할 수 있는 범위를 넘어섭니다.
// 자신이 감당할 수 있는 만큼만 남기므로 정확도가 떨어집니다.
var float: Float = 1234567890.1

// Double은 충분히 수용할 수 있습니다.
var double: Double = 1234567890.1

print("float 값: \(float), double 값: \(double)")

/*
 Character
 
 Character는 말 그대로 '문자'를 의미합니다. 단어, 문장처럼 문자의 집합이 아닌 단 하나의
 문자를 의미합니다. Swift는 유니코드 9 문자를 사용하므로 영어는 물론, 유니코드에서 지
 원하는 모든 언어 및 특수기호 등을 사용할 수 있습니다. 문자를 표현하기 위해서는 값의 앞
 뒤에 큰따옴표를 사용하여 표현합니다.
 */

let alphabet: Character = "A"
print(alphabet)

/*
 String
 
 String은 문자의 나열, 즉 문자열입니다. String은 Character와 마찬가지로 유니코드 9를
 사용할 수 있으며, 값의 앞뒤에 큰따옴표를 사용하여 표현합니다.
 */

// 상수로 선언된 문자열은 변경이 불가능합니다.
let name: String = "geee3"

// 이니셜라이저를 사용하여 빈 문자열을 생성할 수 있습니다.
// var 키워드를 사용하여 변수를 생성했으므로 문자열의 수정 및 변경이 가능합니다.
var introduce: String = String()

// append() 메서드를 사용하여 문자열을 이어붙일 수 있습니다.
introduce.append("제 이름은")

// + 연산자를 통해서도 문자열을 이어붙일 수 있습니다.
introduce = introduce + " " + name + "입니다."
print(introduce)

// name에 해당하는 문자의 수를 셀 수 있습니다.
print("name의 글자 수: \(name.count)")
// 빈 문자열인지 확인해볼 수 있습니다.
print("introduce가 비어있습니까?: \(introduce.isEmpty)")

/*
 Any, AnyObject와 nil
 
 Any는 Swift의 모든 데이터 타입을 사용할 수 있다는 뜻입니다. 변수 또는 상수의 데이터
 타입이 Any로 지정되어 있다면 그 변수 또는 상수에는 어떤 종류의 데이터 타입이든지 상관없
 이 할당할 수 있습니다. AnyObject는 Any보다는 조금 한정된 의미로 클래스의 인스턴스만
 할당할 수 있습니다.
 
 nil은 사실 특정 타입이 아니라 '없음'을 나타내는 Swift의 키워드입니다. 즉, 변수 또는 상
 수에 값이 들어있지 않고 비어있음을 나타내는 데 사용합니다. 변수 또는 상수에 값이 없는 경
 우, 즉 nil이면 해당 변수 또는 상수에 접근했을 때 잘못된 메모리 접근으로 런타임 오류가 발생
 합니다.
 */
