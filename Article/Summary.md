## The Batch Deep Learning(Andrew NG)

### 21.08.11
#### 서론
- DeepLearning에서 경사하강법, 운동량 및 Adam 최적화 알고리즘의 수학적 원리를 이해하면 더 나은 결정을 내리는 데 도움이 된다.
- 또한, 신경망 아키텍처에 대한 지식 역시 성능향상에 도움이 될것이다.
- 하지만, 위와같은 기초 지식보다 중요한건, **현재 상황에서 나에게 우선순위가 될 학습이나 지식을 쌓는게 더 중요하다.**


#### Article 1 - AI Sees Race in X-Rays
- \#Image #CNN
- X-ray를 통해 인종을 인식할 수 있다.
- ImageNet에서 선학습한 Resnet Model로 전이학습 진행했고 80~97% 정확도
    - 체질량, 조직 밀도, 연령 및 성별은 영향주지 않음!
- 여러 질병에 대한 예측정확도가 인종별로 차이가 있음 
- 위 연구 결과를 반영해 선 학습한 데이터를 기준으로 예측하면 보다 정확할 수 있다.


#### Article 2 - Sharper Attention
![](\Article\1.gif)
- \#Textmining
- 작업에 효과적이지 않은 Token을 배제하는 **Expire-Span**이라는 기술을 제안 (Facebook의 Sainbayar Sukhbaatar)
- 원리 : Attention layer를 수정 (**Attention layer는 softmax 함수(다중클래스 분류시 사용)를 사용하는 layer**)
    1. Wikipedia의 enwik8 텍스트 데이터 세트를 학습시켜서, 다음에 나올 토큰을 예측하는 식으로 진행<br> 
    각 토큰이 1값에 수렴하면 살리고, 0으로 수렴하면 해당 토큰을 배제함.
    2. loss function은 모델이 임의로 높은 정확도(예측)를 갖는것을 제한함 (모든 토큰을 쓰는게 웬만하면 정확도가 높기때문)
- 결과 : 총 메모리 사용량, 배치당 교육 시간, 바이트당 비트 수 측면에서 **Expire-span**은 높은 성능을 기록

#### Article 3 - To Bee or Not to Bee
- \#Robot
- 토마토를 재배하는 로봇의 활용 (Australia and the U.S.)
- 자가수분하는 토마토의 특징을 바탕으로 설계된 카메라, 비전 알고리즘 및 공기 압축기가 장착된 로봇으로 재배하는 시스템을 구축

#### Article4 - Fresh Funds for U.S. Research
- 미국 국립과학재단(NSF)은 작년에 설립된 7개의 다른 AI 연구 기관을 보완하는 11개의 국립 인공 지능 연구 기관에 2억 2천만 달러를 투자
- 진행 상황: NSF 보조금은 각 기관에 5년 동안 매년 약 2천만 달러를 제공
    - 농업 : 기후 변화 적응, 식물 모델링, 정밀 농업과 같은 이니셔티브를 위한 보안 인프라 개발
    - 산업 : 반도체 제조 자동화
    - Scientific research: 동적 시스템 제어
    - 등등