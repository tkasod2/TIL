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
                - **Markov chain**
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
        - 채널 분석
            - retargetting
                - 구매를 망설이던 고객에게 다시 한 번 광고를 하는 방법
            - 캠페인 세트를 구성하는 방법을 강구
            - ML을 통한 Targetting

### 02-01 Product에 대한 반응 확인(review text analysis)    
- User Voice
    - blog, SNS, community, play store, ...
    - User Voice에 대한 관심이 커지고, 
    - AI를 통해 토픽관리와 긍부정 분석하여 Review분석을 진행한다.

- Natural Language Processing(자연어 처리)
    > ex. 번역기, Copliot(github),...

    1) Text Normalization; 텍스트 정규화
        - 의미가 같은 텍스트를 동일한 형태로 바꿔주는 것
        - 종류
            - 오타 정규화
            - 축약어 정규화
                > don't -> do not
            - 대/소문자 정규화 (보통은 lowercasing.)
                - 생각보다 많은 영향을 미침
            - URL,문장 부호 제거
            - 불용어 제거 (Removing Stopwords)
                - the, a, there, that
                - 은, 는, 이, 가, ...
            - Stemming (어간 추출)
                - running, runs -> run
            - lemmatization (표제어 추출)
                - better, best -> good
                - 사전을 통해서 Stemming 보다 정교한 정규화 방법
    2) Token화
        - Token : 컴퓨터가 텍스트를 처리하는 단위
            - 주로 stem/lemma, subword 단위로 진행
            - 종류
                - 띄어쓰기 기반 토큰
                - 형태소 기반 토큰
                    - 형태소 단위로 분석
                    - 사전 기반의 library가 존재
                - subword 기반 토큰
                    - **통계적으로 구하는 토큰 단위를 사용**
                    - 데이터셋에 따라 영향을 받음
    3) One-hot encoding
        - 텍스트를 vector로 변형

- 라이브러리 종류  
    - NLTK(전통적 라이브러리)
    - spaCy(영어, 유럽지역 언어에서 최고수준 성능)
    - KoNLPy(한글)
    - Huggingface Transformers (최신 기법들의 총망라. NLP에서 핫하게 쓰이는 중)
    - gensim (topic 모델링 용, 자주 나오는 단어들끼리 묶어주는 lib)
        - bigram 연속되는 두 단어 쌍
        - trigram 3 단어
        - n-gram n개 이상 단어 쌍
        - 자주 등장하는 n-gram을 자동 식별하는것을 *phrase modeling* 이라고함

- Word cloud
    ![image](https://i.stack.imgur.com/8UqhO.png)
    - 직관성, 심미성, 편리성이 있으나, 정확도가 떨어짐

- TF-IDF
    
    - 정보 검색 분야에서 개발됨(portal site)
    - 문서 내 단어 중요도를 측정하는 방법
        1) 자주 등장할수록 중요
            - 하지만, a/that/the 등이 자주 등장하게됨
        2) 단어가 다른 문서에도 자주 나온다면 중요하지 않다. <-- TF-IDF의 핵심
    - TF (Term Frequency) : 특정 단어가 한 문서내에서 얼마나 자주 등장하는가
    - IDF (Inverse Document Frequeny) : 전체 문서집합에서(corpus) 얼마나 자주 등장하는가의 역수
    - TF * IDF
    - Heuristic이기 때문에 입맛에 맞게 바꿔서 활용 가능함.

- Topic Modeling
    - 문서를 주제에 따라 묶는 기법으로, 일종의 클러스터링이라고 볼 수 있음
    - 요약이 가능
    - 전통적 NLP식 표현
        - Bag of Words
        - Count Vectorization
        - 문서 레이어와 단어의 레이어가 있고, 각 문서들은 단어 레이어로 가는 매핑
            - ex. 1~1000번의 문서가 있다고 가정하면,
            - 각 문서별로 돌아가면서 단어 레이어로 가기 위해서 화살표를 그리는 과정
        - 따라서, 문서 벡터가 너무 크다는 단점과
        - 단어 사이에서 연관관계를 도출할 수 없다.
            - ex) '개' 와 '강아지'는 독립적인 단어일 뿐
    - LDA (Latent Dirichlet Allocation)
        > 숨겨져있는/ 디리클레 분포(확률 분포; n진 분류) / 할당  
        - 문서레이어, 단어레이어 사이에 주제 레이어를 추가함
        - 문서는 topic의 mixture
        - topic은 단어의 mixture
        - Document가 어떤 word를 할당할 때, Maximum likelihood를 만들어 줄 수 있는 Topic을 설정해줌.
            - 즉, Topic을 확정적으로 정해준다기보다 argmax함수처럼 최적화 Topic을 도출해주는 역할

### 02-02 감성분석
- 감성분석
    - 텍스트를 분석하여, 담겨있는 감성을 알아내는 것
    - 유저 피드백 분석, SNS 모니터링, 자동 매매(주식 등)
    - 필요성?
        - rating과의 관계
            - 각자 평점을 매기는 기준이 다르다.
            - 잘못 사용하는 경우가 존재
        - 긍,부정 이외의 다른 감성을 분석할 수도 있음
        - rating이 없는 리뷰도 존재한다.

    - 감성분석의 과제
        - 감성이란?
            - 도메인 마다 분류기준이 다름
            - Wheel of emotions;감성의 심리학, 로버트 플루치크
                ![image](https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3APlutchik-wheel.svg&psig=AOvVaw0FaF6ElOdkjKj7sWSG-Rgl&ust=1641343104256000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMiR69btlvUCFQAAAAAdAAAAABAD)
        - 데이터 부족
            - 데이터 레이블링
    - 방법론
        1) 사전 기반 감성 분석
            - 가장 전통적 방법
            - 감성어 사전을 기반 분석 진행
            - (+)단순, 이해하기 쉬움
            - (-)감성어 사전 구축에 드는 시간/비용이 큼, 정확도가 떨어짐(굉장히 정교한 감성어 사전이 필요함), 뉘앙스 체크도 어려움.
        2) 토픽으로 하는 감성 분석
            - 토픽모델링을 통해 토픽마다의 감성을 태깅해 감성 분석
            - (+)비지도 학습, 단어 태깅보다 공수가 적음
            - (-)데이터 볼륨과 노이즈에 영향을 크게 받음, 사전기반 감성분석과 동일하게 결국에는 토픽마다 긍부정 매핑을 해줘야함
        3) 통계로 하는 감성 분석
            - 머신러닝 모델을 기반으로 하는 텍스트 분류 모델
            - Logistic Regrssion : Feature 파라미터 가중합을 통해 sigmoid를 통해 0(부정),1(긍정)로 매핑
            - (+)높은 정확도
            - (-)많은 데이터 볼륨(최소 1,000개 이상)과, 레이블 데이터를 필요로함
        4) 딥러닝을 통한 감성 분석
            - 딥러닝, 특히 사전 학습된 모델의 fine tuning을 통함
            - Transformer(ex.BERT)모델을 주로 사용함
                - Attention : 한 단어의 의미를 해석하기 위해 다른 단어를 살펴봄
                    - ex)"making" > making more/ making difficult
                    - embedding을 통해서 Vector로 바꿔주고
                    - Vector가 state를 넘어가면서, 업데이트
                - Transfer  Learning
                    - BERT 모델을 가져와서, Fine-tuning진행
                    - 적은수의 도메인 데이터셋에서 높은 정확도를 달성하기 위함
            - (+)가장 높은 정확도
            - (-)많은 데이터 볼륨과, 레이블 데이터를 필요로함, GPU 장비
### 02-03 NLP Trend
- BERT
    - Masked Language Modeling
        - 다음 단어를 예측
    - 문장 중간에 빈칸 뚫어놓으면 어떤 단어가 올지 예상
- RoBERTa
- DistillBERT
- BART
- T5
- GPT/GPT2/GPT3
        



## 04. 고객 이탈 분석
### 04-01. 이탈예측
- churn(이탈)
    - 정의
        - 고객이 서비스를 떠나거나,
        - 구독을 취소
    - churn prediction(이탈 예측)
        - 고객 이탈 전, 사전에 고객을 미리 탐지
    - vs bounce
        - bounce : 아무런 event없이 이탈하는 경우
        - churn : 서비스를 사용하다가, 이탈하는 경우
    
- 이탈 예측의 필요성
    - 매출 증대
        - 신규 유저 유치
        - 기존 고객 당 매출 증대
        - **고객 유지율 상승**
    1) 신규고객 확보 비용보다 저렴
        - 이탈 고객 예측을 통해 마케팅 액션을 취할 수 있음
    2) 마케팅 타겟 뿐만 아니라, 마케팅 비용 산정도 가능
        - 고객당 연수익 비교를 통해, 마케팅 비용으로 확보되는 금액을 환산
        - ex) 100만원, 이탈 확률 10%의 고객. 기대 연수익이 90만원
        - 이탈률을 5%로 줄이면, 연수익 95만원.
        - 95만원 - 90만원 = 5만원 => 5만원만큼 해당 고객에 마케팅할 비용
- 이탈 예측 모델
    0) 기본적으로 binary classification model 사용
    1) 학습 데이터 : 이탈 여부(target), 고객 특징
        - 고객 특징
            - 사회 통계적 특징 :ex) 성별, 나이, 교육수준, 소득 등
            - **과거 구매 이력**
            - 사이트 내 활동 이력

    2) 예측 시점
        - 예측 시점과, 이탈 시점간의 차이
            - 너무 빠르면 정확도가 떨어지고,
            - 너무 늦게 예측하면 마케팅 액션을 취하기 어려움
    3) 설명 가능성
        - 고객 이탈 예측 이유를 확인해야함
        - 이에 따라서, 액션의 방향이 달라지기 때문
- 고객 이탈 정의
    - 명시적 이탈
        - 구독 취소(구동 서비스)
        - 계약 해지(통신사)
    - 암시적 이탈
        - 일정 기간 동안 활동 없음(쇼핑몰, 게임 등)
            - **일정 기간의 기준??**
                - 재구매 주기 등에 따라 달라짐
                - 실무자 주관적 판단
                - 등등..
                - ex) 화장품 : 3~6개월, 모바일 게임 : 1일
    - 이탈률 계산
        - 이탈률 = 이탈 고객 수/ 총 고객 수
            - 총 고객 수
                - 분석 기간 첫 날 고객수 기준
                - 분석 기간 마지막 날 고객수 기준
                - 첫 날, 마지막 날 평균 고객수 기준
                - 등등. **"이탈률 계산의 산업 표준 정의가 없다!"**


#### 05. appendix
- AB Test
    - 해당 실험에서 과연 **어떤 결과를** 얻을 것이고, 그에대한 이유가 설명이 가능해야함
    - 가설;hypothesis
        - if__가정___, then___결과___, because ___이유___
        - Variable
            - 독립변인은 보통, ab test의 경우에는 보통 단일변수, 혹은 소수의 변수를 기반으로 변경점을 선정
            - 가정에는 다음과 같은 것들이 들어갈 수 있음
                - 여러 campaign이 집행된 경우 => 각 campaign 간의 상관관계는 전혀 없다라고 가정한다.
                - A에도 나타나고 B에도 나타나는 독립변수가 있는 경우 => 결과 해석에서 제외한다.
                - 효과는 오로지 해당 독립변인에 의해서 발생한다. 
                - ...
        - 결과
            - ROI, CTR, Conversion rate 등의 KPI의 변화가 없다 혹은 있다(h0 or h1)
        - 결과 해석
            - 수치적인 증명
            - 직관적인 증명(다만, 이런 경우에는 나름의 논리를 만들 필요가 있겠다.)
            - if__가정___, then___결과___, because ___이유___
                - 메인 페이지에서 회사명을 빼는것이 더 좋다. 
                - 위 AB test결과에서 확인할 수 있듯이 Conversion Rate가 높았다.
                - 왜냐하면, 회사에 대한 안좋은 이미지가 있었기 때문이다. - 근거는, 설문조사 같은 근거를 가져와도 될듯
                - 따라서, 회사명을 빼자
            - 하지만,
                - 항상 그 결과에 따라가야 하는 근거가 되는것은 아님
                - 결과 분석을 보다 세밀하게 해야할 필요가 있음
                - 가설 공유를 통해 유관 부서나, 동료들에게 허점을 확인해야함
    - 실험 절차 ; Kyle Rush, Head of Optimization at Optimizely
        1) **Identify goals and key metrics**
        2) Create hypothesis
        3) Estimate test duration with a sample size
        4) **Prioritize experiments with projected ROI**
        5) QA the experiment
        6) Set test live
        7) Record and share results
        8) Consider a retest




