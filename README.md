# KIS_EmployeeSurvey

> ### 구동 영상 : https://www.youtube.com/watch?v=Iq8KHQZnxcA
> ### URL : https://kfestival-829c1.web.app  [현재는 투표 종료]

FY2022 신입사원 연수 활동의 일환으로 2023년 6월에 있을 TrueFriends 페스티벌에서 전 계열사 직원들이 입을 단체복을 정하기 위한 투표 웹앱을 개발하였음
[개발 기간 5일]
(Flutter와 Firebase 활용)

<p>
<img width="200" alt="스크린샷 2022-03-06 오전 1 06 39" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/64540656-c556-49c4-a6ad-da4122aac5fa">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/42f31cf5-c6c6-4a7e-90c5-cc76f952fd66">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/5213a1fb-52d6-4f73-88aa-74ee0b0fad64">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/ad1345a7-a34f-4bb3-8f39-0a689d5c9135">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/653ef904-ae6a-494d-a683-a976efa827ed">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/a04ff41a-81b2-477c-bd20-134fbd65ee53">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/3c114ae0-3d3d-4001-8965-7a7eba9a5fbc">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/57b34e71-f0de-4ceb-b777-66040b5a02ed">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/4b0f4fd6-f2a3-47e5-9b7c-04debc1c3dd2">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/97294b41-55ab-4173-bc7e-1f0ca03c7f7a">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/2d080a36-6694-4893-8dff-538e1ba08ee8">
<img width="200" alt="스크린샷 2022-03-06 오전 1 12 26" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/a778f61c-cfee-443f-aa3c-5c432f648be7">
</p>


> ### 개발 과정
Figma로 전달받은 디자인을 참고하여 Flutter로 Client를 개발하고,
Firebase Database에 정보보안에 문제가 되지 않을 Data들만을 담아 투표 시스템 개발 


> ### 예선 투표 (5개 브랜드) 후 결선 투표(2개 브랜드)까지 총 2회 투표
투표 당일 전 계열사 직원 MMS로 투표 URL 발송, 투표 시작시간에 1-2천명이 몰렸지만 안정적으로 투표 진행 완료




> ### Flutter 웹앱 Firebase 배포 방법
  1. npm install -g firebase-tools 로 최신버전 업데이트
  2. firebase init
  3. 아래와 같이 선택
<img width="552" alt="스크린샷 2023-09-15 오후 5 42 54" src="https://github.com/caumannerman/KIS_EmployeeSurvey/assets/75043852/5441e549-5f7e-425a-b0b7-a6c8d83bdc8c">

  5. flutter build web
  6. firebase deploy
