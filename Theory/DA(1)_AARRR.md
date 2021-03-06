# AARRR
- 지표란?
    - 로그를 특정 기준에 따라 요약한 수치
    - 상황과, 목표 및 의사결정의 척도가 됨
- 지표 관리 방향/방법
    - 효율적 지표 관리 (about AARRR)
        - User Lifecycle을 기반으로 stage를 구분
        - funnel형태로 이뤄져 나가야함
        - 지표로부터 태스크를 관리해야함.  


    - Task-based
        - 팀별 담당하는 Task를 기반으로 수치를 관리
        - 중요도의 판단이 어려움
        - Task의 누락이 발생가능성이 있음
        - 제품/서비스 관점의 최적화는 아님

    - AARRR에 대한 유의점
        - 단계별 모니터링이 중요한것이 아님
        - Activation & Retention을 우선적으로 고려하고 나머지 지표를 관리해야함
        - 단계별 문제 정의와 지표를 선별하고 측정해야함
        - 개선이 필요한 목표지표를 선정하고 실험을통해 단계적 개선해야함
## 1. Acquisition : 사용자를 찾아오게 하는 고찰


- 사용자 구분
    - 어떤 채널로 고객유입이 되었는가?(인스타광고, 구글 검색, ...)
    - Organic vs Unknown
        - 자발적인 고객과, 소스를 알 수 없는 고객
        - 자주 혼동하는 포인트
        - 실사례에서는, Indentified와 Unknown의 관계로 생각하는 경우도 존재
    - 사용자의 유입채널을 정확히 파악하고,
    - 어떻게하면 성과를 정확히 판단할 수 있을지에 대한 고민이 필요
- > CAC(Customer Acquisition Cost)* n < LTV(lifetime Value)
    - BM이 과연 지속가능한지에 대한 판단이 필요함
    - 또한, CAC와 LTV중 어떤 지표가 상대적으로 컨트롤하기 용이한가
    - CAC : 유저 획득 비용
        - 세분화가 필요함
        - ex) 어떠한 매체로, 어떤 캠페인으로, 어느 시기에 진행할지 고민이 필요함

### In WEB
- UTM parameter(Urchin Tracking Module)
    - 현 Google Analytics
    - 어느 경로로 들어왔는지 바로 확인 가능하도록 하는 파라미터
    - utm을 붙여서 광고집행하면 이러한 조회가 가능함.(URL뒤에 붙음)

### In Mobile App
- App이 실행되는 순간, User의 유입과정을 유추
- Web가 차이가 나는 이유?
    - app store 설치과정에서 URL에 붙어있는 Parameter는 유실됨.
- Attribution
    - 중간을 이어주는 서비스로 구현 (AppsFlyer, adjust, branch, kochava 등)
    - Attribution window <=> look back window (~기간, 기준)
        - ex. 광고를 클릭하고, 설치하고 실행하는데까지 걸린 시간
        - Click Through vs View Through
            - Click을 하지 않고 view만 있는데, 이를 Attribution window로 설정해야할지
    - Attribution Model
        - 어떠한 touchpoint를 기준으로 윈도우로 삼을것인가!
        - last click, time decay, linear, Position-based, First click 등 다양한 기준으로 설정할 수 있음
    - case study
        - 클릭 vs 뷰
            - 채널 특징에 따라 중요도의 차이가 존재함(동영상 vs 어그로성 팝업)
        - ROAS가 높을수록 좋은가?
            1) 광고 플랫폼에서의 ROAS를 Return이 아닌 Sales를 고려
                - 예를들어 채널1과 2가 500만원의 광고비로, 매출을 5000만원을 얻었지만 순이익의 차이가 있어도 플랫폼에서는 이를 명확하게 인지하지 못함
            2) 또한, 광고비에따른 매출의 증감 패턴이 Linear하지 않음
            3) 여러 매체에서 광고 집행시에는 중복집계 가능성이 있음
            4) 매출이 광고의 효과인지?
            5) 이 외에도 여러 포인트들의 가능성이 존재함
### Attribution에서 발생할 수 있는 Issue
- 딥링크
    - 디퍼드 딥링크 -  ex. 카톡으로 보낸 링크로 설치시, 앱 설치가 안되어있어서 설치화면으로 이동됨
    - UX측면에서 유리함
    - Attribution 성과 측정에 유리함
- Organic Acquisition인지 판단의 방향 혼재
    - SEO(Search Engine Optimization), ASO(Appstore Optimization)
        - 검색어 및 핵심 키워드의 선별
            - APP > "SensorTower > Appstore 최적화" 를 통한 Optimizing
            - WEB > 
            "Blackkiwi"
        - 메타데이터 입력
- 대부분 Last click의 attribution 세팅을 가지고있음. Attribution Model을 어떤걸로 설정?
- Raw Data레벨로 확인하고 분석해야할 필요가 있음
    - 요약데이터가 아니라 RawData까지 접근해야함
- 단순히 툴만을 사용하는 것이 아니라, 의사결정까지의 맥락을 이해해야함. (ROAS 예시 참조)

### Acquisition Summary
- 핵심 채널을 잘 관리해야함
- 채널(ex. 페이스북, 인스타그램, ...)의 최적화와 확장이 필요함
- 정확한 트래킹
- 어트리뷰션툴에 대한 다양한 활용

## 2. Activation : 사용자가 서비스/제품의 핵심가치를 경험했는가
- 사용자 경험의 Funnel에서 각 단계별 전환율(ex.이탈율)을 측정/분석
(Download에서 Onboarding의 끝까지)
- Funnel 분석의 요소  
    1) 핵심가치에 대한 Stage의 정의
        - 사용자의 입장과 회사의 입장을 일치시키는 작업 필요(UX기반)
    2) Stage별 전환율을 어떤 기준으로 측정하는지
        - 결제패턴 예시
            - 하나의 제품만을 여러번 보고 결제가 1회 이뤄진 경우
            - 여러 제품을 보고 그 중 일부 결제가 이루어진 경우
            - Conversion Rate를 과연 뭘로해야할까?
                - User기준?
                - View기준?
                - Product기준?
                - **답이 없는 문제임!!**
            
    3) Cohort별로 보는지
        - Funnel마다의 전환율을 확인하기 위해서, User/Browser/Mobile/세션/event 등을 기준으로 Cohort를 만들어서 분석
            - ex. Mobile vs PC 고객을 따로 분석
            - Event(action)와 시점을 기준으로 cohort를 만드는 경우가 많음
- Funnel 분석의 의의
    - Stage별 Conversion의 확인
    - Conversion과 유관한 선행지표를 발굴할 수 있음
- 이탈 원인 분석
    - **인터뷰**, 설문, 데이터분석
    - Raw Data를 기반으로 Conversion User와 그렇지 않은 User의 분석을 통해 역순으로 확인 가능
- Funnel Summary
    - Conversion을 통해 Global Optimization이 중요
    - Stage를 명확하게 정의해야함
        - 불필요한 Stage를 통해 지표를 발굴했을때 과연 의의가 있을까?
    - Home Try On : Funnel을 역순으로 진행한 Service들이 존재
        - ex> Warby Parker : 안경을 배송하고, 마음에 들면 결제처리 아니면 반송
    - Cohort별 차이가 발생하는 원인을 파악해야함
- Funnel 개선
    - 개인화 : ML, DL이나 Rule 기반 추천 시스템
    - UI/UX : UI의 Redesign을 통해 개선될 수 있는지 검증(ex. AB Test)
    - **사용자 유도**
        - 다음 Funnel로 이동할 수 있도록 유도 하는것
            - ex) 타겟팅을 기반으로한 푸시, 이메일, 인앱 메시지 등등

## 3. Retention : Activation 과정에서 A HA Moment를 꾸준히 경험하도록 하는것
- 일반적으로 재방문을 기반으로 측정
    - 접속을 기준으로 꼭 해야하는지에 대해서는 고민해볼필요 있음
- 개선효과
    - 비용대비 효과가 큼

- Retention 측정 방법
    - Classic Retention(= Day-N Re~)
        - Day N에 서비스를 사용했는지에 대한 여부만 지표로함
        - N 일이 지나고 재방문을 했는가에 대한 Retention
        - (+) 계산과 설명이 쉬움
            - 짧은 주기로 반복적 사용이 중요한 서비스에 적합
        - (-) Noise에 취약
            - Noise를 줄이기 위해서, N의 값을 여러개로 두고, DayN Retention의 평균값을 활용

    - Range Retention
        - 특정 기간에 재방문한 user의 비율
        - (+) 설명하기 쉬움. Day-to-Day Noise에 자유로움
            - 가계부 어플리케이션처럼 특정 간격으로 주기적 사용을 하는 부분에 활용 가능
        - (-) Range가 길어질수록 over-estimate됨
    - Rolling Retention(이탈에 초점을 맞춤)
        - 남은 user를 기준으로 계산        
        '''

            N day뒤 서비스 사용 기록 있는 사람의 수 / 0일에 처음 서비스를 사용한 사람의 수
        '''
        - (+) 계산이 쉬움(첫사용, 마지막 사용 날만 있으면 됨)
        - (-) 이상치,Noise에 굉장히 취약
            - 서비스 사용이 많지 않을 때 활용
            (ex. 여행어플)
    - 약식
        - Engagement=(DAU/MAU)
            - 얼마나 Engage되었는지의 지표로 사용
            - 하지만, DAU/MAU측정이 서비스별로 차이가있음.
- Retention Chart
    ![image](https://baremetrics-wordpress.imgix.net/20200420140137/behavioral-cohort-table.png)
    21분까지..
    - Cohort별로 retention이 어떻게 변해가는지 확인하는 차트
        - ex. 일별(cohort)로 기간이 지날수록 어떤 retention을 보이는지 확인
    - 단순 표 뿐만아니라 차트로 표현하는것도 좋은 방법
    - Activation * Retention * Revenue로 엮어서 생각
- Retention의 기준
    - 접속(log-in)이 유일한 기준인지?
        - 클릭이나 여러 대체 지수를 활용
- Retention 개선
    - 시점을 기준으로 접근
        - 초기 user retention 제어
            - Activation 프로세스 점검
            - 새로운 UX 개선
        - 유지
            - 고객과의 정기적 커뮤니케이션 플랜
            - 휴면 고객 복귀 이벤트 등의 액션
    - 유의점 
        - 지표에 매몰되지 말아야함
            - 푸시/이메일/SMS자주 보내기 -> 일시적 Retention의 향상은 있겠지만 피로관리의 사이드이펙트가 존재
            - 유저 커뮤니케이션 채널의 일원화
        - Key Feature 기준 모니터링
            - 접속이라는 단순한 기준이 아닌 핵심기능 사용 이력, 결제, 방문횟수 등 **핵심기준**을 기준으로 모니터링
            - 당장의 User의 복귀를 바랄것이 아니라, 장기적 관점에서 들어올 이유를 만드는 방법도 고려
        - 축적된 가치
            - 축적 데이터가 많은 경우 당연히 리텐션이 높음
            - 파이가 작은입장이면 축적 가치를 이동할 수 있도록
        - 습관
            - 유저가 app을 습관적으로 들어올 수 있도록 고민
        - etc
            - 장기적 Retention의 중요성
                - 하지만 현 status를 측정하고, 새로운 실험과 효과확인이 어려움
            - 기간에 따라 유동적으로 변해감
                - 시기에 따라 코호트 분석을 해야함
                - 외부요인(ex. 경쟁사 출현 등)
            - 카테고리별 권장되는 retention의 수준이 다름
                - 여행, 쇼핑, 가계부 등등 카테고리별로 차이가 있음
                - 피로관리가 중요함
            - **AARRR에서 Activation과 함께 가장 우선적으로 개선해야하는 지수**


## 4. Revenue : BM의 정의와 제대로 작동하는지에 대한 지표. 매출
- 전사적인 관점에서 업무를 해나가야할 필요가 있음
- Revenue 관련 지표
    - ARPU (Average Revenue Per User) : Revenue/User
        - 전반적 상황을 보는데 유용함
        - 하지만, User와 Revenue의 구분이 어려움
        - 일반적으로 Monthly기준으로 정의
            - ex. MAU, ARPDAU,...
    - ARPPU (Average Revenue Per Paying User) : Revenue/Paying User
    - ASP (Average Selling Price) : Revenue/ 판매횟수
    - Lifetime Value(유저생애가치) : User의 진입~ 이탈까지 전체활동기간동안 누적 발생되는 기대수익
        - $CLV =$ $ (M-c)\over(1-r+i)$ $ - AC$
            - M: 1인당 평균 매출// c: 1인당 평균 비용 // r : 고객 유지 비율 // i: 할인율 // AC : 고객 획득비용
        - Lifetime Value = ARPU / Churn
            - Churn : 고객 이탈비율
        - 하지만, 현실에서 이러한 계산을하는 경우는 거의 없음
        - 대안?
            - LTR (Lifetime Revenue)의 활용
                - 비용의 계산이 어려우니 매출에 계산만을 지수로 활용
                - 고객의 수는 이탈하는 여부를 판정하지않고 쭉 같은 숫자를 유지
                - CAC, LTR, ROAS를 비교하면서 생각
- Revenue의 형태
    - 아이템별 매출의 합계
    - 스토어별 매출의 합계
    - 회원별 매출의 합계
    - ...
    - in 구독 서비스,
        - MRR(Monthly Recurring Revenue)
            - Base MRR(전월 MRR) + New MRR - Churn MRR + upgrade/downgrade MRR
- 핵심사용자와 고래
    - 고래 : 많은 금액을 발생시켜주는 고객
    - 서비스의 영향력이 크기때문에, Operating 측면과 Revenue측면에서 가장 우선적으로 고려해야함
- RFM 분석
    - 기준을 정해서 점수로 평가
    - Recency : 얼마나 최근에 결제했는지
    - Frequency : 얼마나 자주 결제했는지
    - Monetary : 얼마나 많은 금액을 결제했는지
    - 점수의 Total 점수로 Group을 나눠서 User를 Segement
        - User별로 다른 프로모션을 진행
    

## 5. Referral : Organic 유입의 한 종류. 입소문을 통한 user 확대
- 주요 지표
    - Viral Coefficeint
        - User * Invitation rate(초대에 참여한 사람의비율) * Invitation sent per user(초대 시 몇명씩 초대?) * conversion rate(사용 전환율) / User

    - 고려사항
        - 주기에 대한 고려
        - Saturate 수준 고려
            - 초대받을 수 있는 사람이 한정적이므로 타겟층에 대한 고려가 필요
        - 초대받은사람이 핵심가치를 경험했는지, ... 
    - Viral Coefficient의 기준점은 1

    ![Image](https://upviral.com/wp-content/uploads/2015/08/viral-coefficient-1.png)
    - 1을 초과하면 그때부터 엄청난 가속이 됨
- Referral 고려사항
    1) 제품의 퀄리티
    - Viral loop는 좋은 제품이 선행조건
    2) Viral channel이 잘 작동하는가 Growth의 필수조건인지에 대해서는 고려해볼 필요가 있음
    3) Viral할 수 있도록 맥락의 설계
    - 추천을 할 이유를 만들어줘야함
    4) 초대하는사람과 초대 받는사람의 경험을 나눠서 각각 최적화해야함
    5) NUX : New User Experience
    - 가입과 온보딩 프로세스의 최적화
        - 특히, 단 한 번 겪는 경험이므로 가장 잘 설계해야함
