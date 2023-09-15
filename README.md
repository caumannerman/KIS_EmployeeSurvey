# KIS_EmployeeSurvey

구동 영상 : https://www.youtu

사내 투표를 위한 
IOS 학습에 중점을 두었기 때문에, 자료구조시간에 배우는 Stack을 사용한 연산자 우선순위 처리까지는 구현하지 않았고, 입력되는 순서대로 계산이 되도록 구현하였다.
RoundButton 클래스를 @IBDesignable, @IBInspectable annotation으로 작성하여 속성 Inspector에서 적용할 수 있게 하였고, didSet 프로퍼티 옵저버를 사용해 UIButton의 모양을 바꿔주었다.
소숫점 연산, Clear 등 아이폰 내장 계산기와 유사하게 구현하였다.
연산자 별 계산은 enum으로 정의해놓은 연산자 case와, 연산자를 인자로 받아 switch문으로 처리하는 operation함수로 정의하였다.
@IBAction함수, @IBOutlet 변수를 storyboard와 코드 상에서 연결하는 것이 핵심이었다.
didset과 위의 두 annotation들은 버튼의 모양을 둥글게 만드는 데 사용하였다.

> ### 1.1 프로퍼티 옵저버 
swift가 제공하는 프로퍼티 옵저버에는 willSet, didSet 두가지가 있다.
프로퍼티 옵저버는 property의 값 변화를 관찰하고 이에 응답한다.
조건에 따라 연산 프로퍼티에 적용 가능하나, 기본적으로 저장 프로퍼티 (Stored Property)에 적용된다.
저장 프로퍼티의 값이 변화하기 직전에 willSet -> 값 변화 -> 값이 변한 직후에 didSet 이 실행된다.

<img width="400" alt="스크린샷 2022-04-12 오후 10 49 28" src="https://user-images.githubusercontent.com/75043852/162977548-9438a3d7-dd6e-4bc1-996f-5456651807dc.png">

> ### 1.2 @IBInspectable
annotation을 달아, 스토리보드에서 @IBInspectable이 달린 변수의 값을 변경할 수 있게 함. 즉 IB와 해당 변수가 연결되었다라는 것을 컴파일러에게 알리는 신호 @IBInspectable


> ### 1.3 @IBDesignable
변경된 설정값을 스토리보드상에서 실시간으로 확인할 수 있도록 , 즉 런타임(시뮬레이터)이 아니라 컴파일타임에 확인할 수 있다.


<p>
<img width="200" alt="스크린샷 2022-03-06 오전 1 06 39" src="https://user-images.githubusercontent.com/75043852/156891174-b8ec6761-fbe4-4c93-b51a-afb4d78d25d0.png">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://user-images.githubusercontent.com/75043852/156891393-3d3fa7a9-bc43-4521-9349-520413f2109f.png">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 51" src="https://user-images.githubusercontent.com/75043852/156891398-ee6627bf-78c7-48af-965a-fc429078bf96.png">
<img width="200" alt="스크린샷 2022-03-06 오전 1 13 02" src="https://user-images.githubusercontent.com/75043852/156891401-61217d85-6b98-4603-a2d8-ded7b2c5078b.png">
</p>
