## 1. 프로젝트 소개
  ### (1) 시스템 소개
  #### ㄱ. 사이트 소개
          이름: 오늘 어디가지? (Oaga)
          - 여행을 좋아하는 사람들을 위한 국내 여행지 정보 조회 및 커뮤니티 사이트
          - 핵심기능
             1. 국내 도시별 핫플레이스 정보 조회
             2. 여행자 리뷰 작성 및 조회, 수정, 임시저장, 등록
             3. 여행리뷰 댓글, 좋아요 기능
             4. 베스트리뷰어 조회
             5. 회원가입, 로그인( + Oauth 2.0 카카오 로그인)
             6. Mypage, Userpage CRUD
             7. 관리자 페이지 CRUD

![Screenshot_4](https://user-images.githubusercontent.com/100888879/181200672-49299dee-823a-4a89-b001-f1cd38a33d76.png)
![Screenshot_5](https://user-images.githubusercontent.com/100888879/181200464-15acd83a-4fe6-4dca-bc49-363ef261af4b.png)
![Screenshot_6](https://user-images.githubusercontent.com/100888879/181200474-a5db6712-ed2e-4ad6-8b6b-fecc58e3343a.png)
![Screenshot_2](https://user-images.githubusercontent.com/100888879/181200535-93ef6d50-fca6-4bc7-b8d4-f1b517a186fe.jpg)
![3](https://user-images.githubusercontent.com/100888879/181201177-38b7cf8c-0340-48a3-9cd7-ce75ce2fe302.png)

  ### (2) 프로젝트 설계 배경
## 2. 기능 소개
  ### (1) 사용자페이지
  #### ㄱ. 회원가입
![1](https://user-images.githubusercontent.com/100888879/181200135-d13f7922-2971-48d6-8739-463bf963e86a.png)
![2](https://user-images.githubusercontent.com/100888879/181200145-a0cdde07-d7a8-46f0-bae2-b776006d4b6d.png)

  #### ㄴ. 로그인(+ 소셜로그인)
  ![login](https://user-images.githubusercontent.com/100888879/181204048-89f3d0ef-d6e0-43e8-8fd0-38fa392db76b.jpg)
  ![image](https://user-images.githubusercontent.com/100888879/181204779-08b38dab-eb52-4d32-9385-5f9cec3cdfc6.png)

  #### ㄹ. Mypage / Userpage
  * 좋아요
  ![Screenshot_16](https://user-images.githubusercontent.com/102580742/181395010-681dc870-0623-4a8b-b0ca-5ec7c057cf85.png)
  ![Screenshot_17](https://user-images.githubusercontent.com/102580742/181395039-e820d6c7-2b23-4f3a-bd57-974d5524efab.png)
  ![Screenshot_18](https://user-images.githubusercontent.com/102580742/181394729-5ecf6ee7-0013-4720-841f-1f01aec54661.png)
  * 내가 작성한 리뷰 리스트
  ![Screenshot_2](https://user-images.githubusercontent.com/100888879/181204145-0367e548-70cc-45f7-8b4b-2cd85a47d25f.jpg)
  #### ㅁ. 여행지정보
  ##### ㅁ-1 도시에 어떤 구들이 있는지 보여주는 페이지
  ![Screenshot_1](https://user-images.githubusercontent.com/102271558/181395767-906efcd3-4e5d-4a06-990a-2a5090f08a00.png)
  ![Screenshot_2](https://user-images.githubusercontent.com/102271558/181395780-c357e375-5395-42e6-bdbd-571dc40e62e6.png)
  ##### ㅁ-2 한 구의 (카페/식당 + 놀거리) 정보
  ![Screenshot_1](https://user-images.githubusercontent.com/102271558/181396858-96da63aa-0f52-47c8-9533-ee13fd4836ab.png)
  ![Screenshot_3](https://user-images.githubusercontent.com/102271558/181395789-68df0c33-4807-4224-9551-24412b8a9e1f.png)
  ##### ㅁ-3 카페/식당 or 놀거리에 대한 자세한 정보
  ![Screenshot_4](https://user-images.githubusercontent.com/102271558/181395795-2807da3a-9d84-4779-93ae-6d4d11ff80f0.png)
  ##### ㅁ-4 한 도시의 모든 정보
  ![Screenshot_5](https://user-images.githubusercontent.com/102271558/181395797-9a3be65e-4a90-4d17-abbe-5e1f4e5de1c1.png)
  ![Screenshot_6](https://user-images.githubusercontent.com/102271558/181395802-f5a07693-9e1f-46b7-9e60-442eeef8c6c9.png)
  ##### ㅁ-5 해당 도시/구에 내용이 없다면 업데이트 중 이라고 알려 주기
  ![Screenshot_2](https://user-images.githubusercontent.com/102271558/181396938-2e472f5e-781d-4e94-975b-64b73d8090b9.png)

  ### (2) 관리자페이지
  ![ddd](https://user-images.githubusercontent.com/100888879/181393741-34b605c1-091d-43d9-b533-88b52dc366f5.jpg)
  #### ㄱ. 데이터 추가
  ##### 위에 카페/식당 or 놀거리 클릭 후 추가할 도시선택 > 구 선택 > 추가할 내용 및 이미지 작성
  ![Screenshot_9](https://user-images.githubusercontent.com/102271558/181395375-811b92cb-8502-40b5-a690-f14aedbe122c.png)
  ![Screenshot_10](https://user-images.githubusercontent.com/102271558/181395387-0fbe7063-63e2-46ea-b8db-1ea7d94f25dc.png)
  ![Screenshot_11](https://user-images.githubusercontent.com/102271558/181395411-47e28436-61c1-4841-b779-2b8b72d98514.png)
  ![Screenshot_12](https://user-images.githubusercontent.com/102271558/181395425-cb5b911d-36d2-4c7f-8f67-e62b2bcfadb2.png)
  #### ㄴ. 데이터 수정
  ##### 위에 카페/식당 or 놀거리 클릭 후 추가할 도시선택 > 구 선택 > 수정 할 곳 선택 > 수정할 내용 작성
  ![Screenshot_13](https://user-images.githubusercontent.com/102271558/181396548-391e855e-649e-4eb1-8cd2-0a49ce2d1d8a.png)
  ![Screenshot_14](https://user-images.githubusercontent.com/102271558/181395541-47355efd-b2e7-45c3-ae01-9715f6e931b5.png)
  ![Screenshot_15](https://user-images.githubusercontent.com/102271558/181395463-479a3141-5cc5-4a70-98a2-c79c50010ff7.png)

  #### ㄷ. 데이터 삭제
  ![Screenshot_17](https://user-images.githubusercontent.com/100888879/181204618-f7558954-4325-4e02-81af-36ee3999935c.png)
