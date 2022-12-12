# GithubRepoSearchApp

![Simulator Screen Recording - iPhone 14 Pro - 2022-12-12 at 23 17 54](https://user-images.githubusercontent.com/28377820/207068310-ceb59344-eadf-4238-85d6-f281c81ee590.gif)

### 프로젝트 설명
- Github 저장소를 검색하면 검색 결과 목록을 보여주는 앱 (Github iOS 앱의 저장소 검색 기능과 동일)
- [Github REST API](https://docs.github.com/en/rest/search?apiVersion=2022-11-28#search-repositories)에서 제공하는 'Search repositories API'를 이용
- 네비게이션 바의 검색창에 키워드를 입력 후, 키보드의 검색 버튼을 누르면 하단의 테이블 뷰에 검색 결과가 나타남
- 테이블뷰를 스크롤 다운하다가 맨 아래에 도달하면 페이지네이션이 되도록 구현 (다음 페이지 목록 가져와서 덧붙이는 기능)

### 개발 환경
- Xcode 버전: Version 14.1 (14B47b)
- Simulator 버전: Version 14.1 (986.5)
- 최소 타겟 버전: iOS 16.1

### 기술
- 아키텍처: MVVM
- 사용 기술: UIKit, StoryBoard(AutoLayout), ReactiveX, Swift Package Manager
- 의존성: Alamofire, RxSwift, RxCocoa
