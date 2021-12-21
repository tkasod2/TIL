# 데이터 분석 실무
- 데이터 분석의 목적
  - 과거를 이해한다. 
      - EDA
      - 요약/집계
          - DAU, MAU 등
      - 변수간 관계와 패턴의 파악
      - 실험설계
  - 미래를 예측한다.

- 지표 (~ 요약&집계)
	- 비즈니스에 대한 가설을 세우고 그에 맞는 적절한 지표를 세워야함
    - 좋은지표란?
    	- 쉽고 직관적이고, 팀의 행동을 이끌어내야함
        - 단순집계가 아닌 **기간, 유저 그룹, 경쟁사와의 관계**를 기반으로 설명하는것이 좋음
        	- ex. 12월의 블로그 유입수는 11월 대비 XX %늘어난 OOO명이었습니다.
        - **비율**의 지표가 보통 좋은 지표다.
        	- 신규고객수 대비 이탈 고객수의 비중은 XX %로 XXX명 입니다.
        - 문제를 해결할 지표여야한다.
        - 정의가 명확해야한다.
        	- 구매전환율의 정의를 무엇으로 정할것인지
            - 기간 segment
            - user의 정의
            - 23:59와 00:01의 차이

## 01. 유저 데이터 분석
### 01-01. 유저 행동 분석을 통한 건강성 평가
- 주요 지표
	- Active Users
    	- 특정 기간동안 들어온 **Unique**한 유저 수
        	- ex) 만약 12월 한달 동안 100,000 방문 로그가 있고, 4,000명의 Unique 유저가 있었다고 치면, 12월 DAU는 4,000입니다.
	    - DAU / MAU
        	- 100% 수준이면, 신규유입이 없다는 뜻
            - 3.3% 수준이면, 한달동안 매번 새로운 유저가 유입된다는 뜻
            - 10~20%를 평균 수준으로 침
    - 세션 vs Active USer
        - 세션 : 서비스에 방문부터 나가기까지의 여정이 하나의 세션
        - 즉, Active USer 1회지만 1회 이상의 Session이 가능
        - 세션의 기준?
            - in browser
                - 클릭과 다음 클릭이 n분 이상일 때 구분 (GA 기준 30분)
                > 12시에 들어왔다가 12시 10분에 주문하면 1회의 세션
                
                > 12시에 들어왔다가 12시 30분에 주문하면 2회의 세션
            - in mobile
                - 백그라운드로 app이 빠졌다가 포그라운드로 전환할 때
        - 페이지뷰
            - 화면 전환 당 +1 씩.
                - ex) 회원가입 +1, 로그인 +1, 메인 페이지 +1
        - 클릭 수
            - 같은 페이지 내에서 클릭이나 터치에서 +1
            - 스크롤이나 체류시간 등을 통해서 관심도를 측정할 수 있음
    - Case Study
        - 유저수 10만 << 페이지뷰 100만 : 서비스에 대해 적극적인 유저가 많군!
        - 유저수 10만 <= 페이지뷰 10만 : 서비스의 건강도가 떨어지는것으로 보이는군.
        - 유저수 10만 = 세션수 10만 : 하루에 한번씩만 방문하는군.
        - 유저수 10만 << 세션수 100만, 페이지뷰 200만 : 적극적 유저가 가장 많군!
- Cohort 분석
    - 서로 다른 집단 간의 "기간 별 패턴"을 보고 싶을 때 하는 분석
    - 코호트 : 공통된 특성을 공유하는 집단
    - 유입 시점별 고객의 상이함을 파악하기 좋음
    - set_index + unstack // pivot_table

- 추가 지표들
    - 세션의 길이
        - 세션수만 보는게 아니라, 얼마나 **체류시간**까지 고려하는것이 좋음
            - 무조건 길다고 좋은건 아님.
            > 예를들어, 검색 서비스라면 검색 결과의 불만족으로 살펴보는데 소요되는 시간이 길어질 수도 있음
    - 이탈률(Bounce Rate)
        - 이탈(Bounce) : Event없이 나가는 경우
    - CLV(Customer Lifetime Value), LTV(Lifetime Value)
        - 고객+생애+가치
            - 서비스에 가입하고 탈퇴/휴면 까지 얼마나 가치가 있는지.
            - 고객유치비용에 대한 비용을 계산할 때 유의미함
            - 고객, 생애, 가치를 각각 어떻게 정의할지 고민 필요(기업별 차이가 있음)
                - 생애 : GA기준 90일
                - 가치 : Revenue, Profit 등등

### 01-02. 유저 군집 분석
- 유저 군집 분석(Clustering)
    - Clustering? : 비슷한 특성을 가진 여러개의 그룹으로 나누는 비지도 학습의 일종
        - 정답이 있다면 분류
    - Intra-cluster는 가깝게, Inter-cluster는 멀게 그룹을 설정하는것이 이상적
    - 종류
        - Partition-base Clustering
            - K-means(대표적 방법)
                1) k값 설정
                2) Random으로 k개의 Centroid 설정
                3) 데이터를 돌면서 어디랑 가장 가까운지(Euclidean Distance씀)를 기반으로 그룹에 데이터 할당
                4) 그룹별로 다시 평균점을 Centroid(중심점)을 설정
                5) 3~4 반복 후, 그룹이동이 발생하지 않으면 stop
            - 그 외
                - K-Medois, K-models,...
        - Hierachical based Clustering(agglomerative clustering)
            - 거리가 가까운 군집 두개를 선택하여 하나로 합치면서 군집 갯수를 줄여가는 방법
            - 토너먼트식의 그래프(msno 그래프 떠올리면 편함)
            - 거리 계산 법
                - Centorid Distance
                    - 군집 centroid 사이의 거리를 사용
                    - 일반적으로 모든 클러스터링에서 활용함
                - Median Distance
                    - only for , Hierachical base Clustering
                    - 군집 s와 t로 만들어진 군집 u가 있을 때, s와 t의 centroid 평균을 활용
        - Density based Clustering
            - 데이터 밀도를 기반으로하는 클러스터링 기법
            - DBSCAN Clustering (대표적 방법)
                - Hyper parameter 설정
                    - a : 최소 거리 (A 그룹으로 묶기위한 기준)
                    - b : 최소 데이터 갯수 (그룹으로 인정받기 위한 최소한의 데이터 수;; 밀집지역 정의 목적)
                - a안에 있는 데이터는 이웃으로 정의
                - a 안에 b개 이상 데이터가 있으면 해당 데이터를 core로 정의
                - core 데이터는 하나의 클러스터를 형성하고, core와의 거리가 a 안에 있으면 클러스터로 분류
            - vs K-means
                - K-means는 중심점 기준으로 그룹형성하기 떄문에, 원의 형태로 군집이 형성
                - 반면, DBSCAN은 불특정한 모양으로 형성됨
    - 평가
        - Label이 없기 떄문에 accuracy등을 평가할 수 없다.
        - Silhoulette Coefficient ; 실루엣 계수
            - 컨셉 **Intra-cluster는 가깝게, Inter-cluster는 멀게**
            - $a_i$ : i와 같은 군집에 속한 원소들간의 평균 거리(intra-distance)
            - $b_i$ : i와 다른 군집 중 가장 가까운 군집까지의 평균 거리
            - $S_i$ $=$ $b_i-a_i \over max(ai,bi)$
            - 컨셉에 따라, $a_i$가 작을수록, $b_i$가 클수록 좋은데 실루엣 계수를 살펴봤을떄, 1에 가까울수록 고평가를 받게 될 것이고(max값은 1을 넘지 못함), -1에 가까울수록 저평가를 받게 될 것이다.
   
    - Elbow Method
        - 데이터를 몇개의 그룹으로 군집화 해야할까?
        - WSS(군집 내 분산)이 작을수록 좋음
        - WSS가 유의미하게 작아지지 않을떄 K를 늘리는것을 stop
        - ![image](https://heung-bae-lee.github.io/image/how_to_determine_optimal_k_in_k_means_clustering_01.png)

- 고객 유입 채널 분석
    - 마케팅이란??
        - 소비자의 충족되지 못한 욕구를 발견
        - 회사 서비스/제품과 연결
        - 회사의성장/ 판매
    - Digital Marketing의 성장세
        - eMarketer 조사 결과에 따르면, 67%가량이 미디어를 활용한 마케팅을 하고있음.
        - ex) 빙그레 도른자, 신한 라이프 로지 캐릭터, 현대모비스 가상기술 전시회 등등
    - 디지털 마케팅??
        - 노출 > 인지 > 탐색 > 전환 /구매 > 팬
        - 종류
            - email marketing
            - SEO(Search Engiene Optimize)
                - Organic Search
                - 류범상을 입력했을때 블로그를 노출시키는 마케팅
            - Paid Search
            - Social media
            - ...
        - 하나의 브랜드에 인지할 때, 여러 개의 광고에 노출된 후에 구매행위를 한다.
        - **따라서, 어떤 "채널"의 광고의 기여도가 높은지를 파악할 필요가 있다. **
        - 용어 정리
            - 채널
                - 인스타그램, 카카오톡, 네이버 검색 등
            - 캠페인
                - 채널 안에 여러개의 광고가 있는데 이 각각의 광고를 캠페인이라고 한다.
            - 노출(Impression)
                - 유저가 액션이 없더라도 캠페인을 한 번이라도 봤으면 노출이라고 함
            - 전환(Conversion)
                - 회사가 원하는 행동을 했다면 "전환"이라고 한다.
                    - 보통은 구매로 이어지는 전환을 일컫는다.
                        - ex. 앱 설치, 구매 행위, ...
        - 기여도 분석
            - 도메인 기반 기여도 분석
                - Last Interaction Attribution Model
                    - 마지막 접한 채널의 기여도를 100%로 본다. (GA기준)
                - First Interaction Attribution Model
                    - 첫 번째로 접한 채널의 기여도를 100%로 본다.
                - Linear Interaction Attribution Model
                    - 모든 채널의 기여도를 동일하게 본다.
                    - 하나의 캠페인에 여러번 impression 되었어도, drop_duplicates 처리한다.
            - 통계적 기법
                - Markov chain
                    - X1, X2, X3 .. 사건의 Sequence에서, 다른 state로 이동하는 확률은 과거 전부가 아니라 현재의 사건에서만 영향을 받음
                    - 이미 과거 관측값이 더 앞선 과거의 영향을 받았으니,
                    - 직전 관측값만 신경쓴다. (**memoryless**)
                    - 전이 확률 행렬 (**Transition Probability**)
                    ![image](https://i.ytimg.com/vi/IYaOMor9qvE/maxresdefault.jpg)
                    - removal effect (제거효과)
                        - 전환에 대한 기여도를 계산하는 방법
                        - 예를들어, email channel의 기여도를 구한다고 치자
                        - e-mail 채널이 conversion rate가 0%라고 가정을 한다.
                        - e-mail을 거치는 path의 CVR이 40%
                        - e-mail을 거치지 않는 path CVR이 10%
                        - 전체 CVR은 50%
                        - Removal effects for e-mail = 1 -(0.1/0.5) = 0.8
                - Absorbing Markov Chain
                    - 특정 State에서 Chain이 끝나는 Markov Chain
                        - [example](https://brilliant.org/wiki/absorbing-markov-chains/)
                        

    














