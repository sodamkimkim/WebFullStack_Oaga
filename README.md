## 1. 프로젝트 - Oaga 오늘 어디가지?
  ### (1) 시스템 소개
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
  ##### 코로나19로 인해 해외여행을 자유롭게 갈 수 없기 때문에 요즘 국내여행에 대한 수요가 늘고있습니다. 
  ##### 그래서 사람들이 국내여행에 대한 정보를 한눈에 볼 수 있는 사이트가 있으면 좋을 것 같다는 의견을 나누어 Oaga 사이트를 만들게 되었습니다.
  ##### 국내 여행지에 대한 정보 뿐만 아니라 사용자들이 자신이 다녀온 여행 리뷰를 자유롭게 게시할 수 있도록 하여, 다양한 정보를 주고받을 수 있는 사이트가 되도록 설계했으며,
  ##### 댓글기능과 좋아요 기능들을 추가하여 하나의 여행 커뮤니티 사이트가 될 수 있도록 구현하였습니다.
  
## 2. 기능 소개
  ### (1) 사용자페이지
  #### ㄱ. 회원가입
![1](https://user-images.githubusercontent.com/100888879/181200135-d13f7922-2971-48d6-8739-463bf963e86a.png)
![2](https://user-images.githubusercontent.com/100888879/181200145-a0cdde07-d7a8-46f0-bae2-b776006d4b6d.png)

  #### ㄴ. 로그인(+ 소셜로그인)
  ![login](https://user-images.githubusercontent.com/100888879/181204048-89f3d0ef-d6e0-43e8-8fd0-38fa392db76b.jpg)
  ![image](https://user-images.githubusercontent.com/100888879/181204779-08b38dab-eb52-4d32-9385-5f9cec3cdfc6.png)

  #### ㄷ. Mypage / Userpage
  * 좋아요
  ![Screenshot_16](https://user-images.githubusercontent.com/102580742/181395010-681dc870-0623-4a8b-b0ca-5ec7c057cf85.png)
  ![Screenshot_17](https://user-images.githubusercontent.com/102580742/181395039-e820d6c7-2b23-4f3a-bd57-974d5524efab.png)
  #### 마이페이지에서 좋아요부분을 클릭하면 나를 좋아요한 사용자들의 닉네임을 조회할 수 있다.
  ![3](https://user-images.githubusercontent.com/102580742/181398602-dacf8d5d-5e1c-41e4-9259-67ec3b13d862.png)
  * 내가 작성한 리뷰 리스트
  ![Screenshot_2](https://user-images.githubusercontent.com/100888879/181204145-0367e548-70cc-45f7-8b4b-2cd85a47d25f.jpg)
  #### ㄹ. Mypage / Userpage
  ##### ㄹ-1 조회수가 높은 리뷰순으로 베스트리뷰 조회
  ![1](https://user-images.githubusercontent.com/102580742/181399001-9c9cb19b-fa2f-45a7-a55a-ce7839708997.png)
  ##### ㄹ-2 좋아요 수가 많은순으로 베스트 리뷰어 조회
  ![2](https://user-images.githubusercontent.com/102580742/181399004-b2415077-e9d0-4514-a640-7dc45bb14ec7.png)
  ##### ㄹ-3 로그인이 되어있는 사용자의 경우, 자신의 정보를 화면에서 볼 수 있다.
  ![4](https://user-images.githubusercontent.com/102580742/181399015-d0f53f79-a029-47a0-81f2-abca7a52042b.png)
  ##### ㄹ-4 리뷰 작성 페이지
  ![5](https://user-images.githubusercontent.com/102580742/181399018-e18f5301-7dbd-4b6b-a8cc-32254dc85193.png)
  ##### ㄹ-5 리뷰 상세 페이지
  ![6](https://user-images.githubusercontent.com/102580742/181399130-a7912a5a-bf6f-4950-bc05-579a5d5def6d.png)
  ##### ㄹ-6 리뷰 검색 기능
  ![7](https://user-images.githubusercontent.com/102580742/181399138-b732cc00-4aea-4ec1-b9a2-a423baaadddb.png)
  ![8](https://user-images.githubusercontent.com/102580742/181399143-afac873f-3aa2-458c-9c99-0c49b871151f.png)
  ##### ㄹ-7 리뷰 전체보기
  ![11](https://user-images.githubusercontent.com/102580742/181399147-f2aee404-b3eb-4569-b659-72e99168febe.png)
  ![12](https://user-images.githubusercontent.com/102580742/181399149-b4d0ee27-472c-46cc-a73a-0256301fb92f.png)
  
  #### ㅁ. 여행지정보
  ##### ㅁ-1 여행지 검색 기능
  ###### 자신이 가고싶은 지역을 검색할 수 있다.(검색어 자동완성 기능)
  ![10](https://user-images.githubusercontent.com/102580742/181399256-6e1027c4-10d2-4b4c-9c58-ec7a9d496edc.png)
  ##### ㅁ-2 도시에 어떤 구들이 있는지 보여주는 페이지
  ![Screenshot_1](https://user-images.githubusercontent.com/102271558/181395767-906efcd3-4e5d-4a06-990a-2a5090f08a00.png)
  ![Screenshot_2](https://user-images.githubusercontent.com/102271558/181395780-c357e375-5395-42e6-bdbd-571dc40e62e6.png)
  ##### ㅁ-3 한 구의 (카페/식당 + 놀거리) 정보
  ![Screenshot_1](https://user-images.githubusercontent.com/102271558/181396858-96da63aa-0f52-47c8-9533-ee13fd4836ab.png)
  ![Screenshot_3](https://user-images.githubusercontent.com/102271558/181395789-68df0c33-4807-4224-9551-24412b8a9e1f.png)
  ##### ㅁ-4 카페/식당 or 놀거리에 대한 자세한 정보
  ![Screenshot_4](https://user-images.githubusercontent.com/102271558/181395795-2807da3a-9d84-4779-93ae-6d4d11ff80f0.png)
  ##### ㅁ-5 한 도시의 모든 정보
  ![Screenshot_5](https://user-images.githubusercontent.com/102271558/181395797-9a3be65e-4a90-4d17-abbe-5e1f4e5de1c1.png)
  ![Screenshot_6](https://user-images.githubusercontent.com/102271558/181395802-f5a07693-9e1f-46b7-9e60-442eeef8c6c9.png)
  ##### ㅁ-6 해당 도시/구에 내용이 없다면 업데이트 중 이라고 알려 주기
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
