## RNN

<details markdown="1">
<summary>21.08.26 Seminar seq2seq</summary>

### 21.08.26 Sequnce to Sequnce (seq2seq)
- 다음 주제 : https://ratsgo.github.io/natural%20language%20processing/2017/03/09/rnnlstm/
- 출처 : https://wikidocs.net/24996
- 출처2 : https://bkshin.tistory.com/entry/NLP-13-시퀀스투시퀀스seq2seq

- seq2seq : 입력 시퀀스로부터 다른 도메인의 시퀀스를 출력하는 모델
    - 대표 예시 : 챗봇(질문->대답), 번역기(영어->한글)
- 거시 -> 미시순으로 정리
![image](https://wikidocs.net/images/page/24996/%EC%9D%B8%EC%BD%94%EB%8D%94%EB%94%94%EC%BD%94%EB%8D%94%EB%AA%A8%EB%8D%B8.PNG)
    - 입력 -> 인코더 -> (Context Vector) -> 디코더 -> 출력
    > 인코더 : 입력 문장을 받는 RNN 셀
    > 디코더 : 출력 RNN셀 | 입력문장으로 출력문장을 예측하는 언어모델 형식
    - 단, 실제로는 성능문제로 RNN셀은 바닐라모델말고, LSTM or GRU셀로 구성
    > 컨텍스트 벡터 : 인코더 RNN 셀의 마지막 은닉 상태
    > 디코더의 초기 입력에는 <sos>가 입력, 마지막에는 <eos> 가 출력.
    - Test 단계 : 디코더는 초기 입력 단어에서 다음에 등장할 확률이 높은 단어를 예측 (그림에서는 je를 예측)하고, 이를 반복
        - context vector와 <sos>를 입력값으로받고, 디코더의 첫 RNN 셀은 이를 바탕으로 첫 단어를 예측.
        - 예측된 단어와, 두번째 스텝에서의 입력값으로 두번째 단어 예측
        - 최종 예측값이 <eos>일 때 까지 반복.
        - 디코더가 RNN셀을 출력하면, 여러 단어의 벡터값이 나옴
        - 이를 가장 확률 높은 단어로 선택하기 위해서, softmax를 취해줌

    - Train 단계 : **교사강요**
        > ? 교사강요
        > 일반 RNN은 n-1 스텝에서 RNN 예측값을 n 스텝 입력값으로 사용
        > **교사강요는 n-1 스텝 실제값을 n 스텝 입력값으로 사용하는것**

</details>
    

## The Batch 자료 요약
### 21.08.24 The Batch (21.08.11자료)
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


#### **Article 2 - Sharper Attention**
![gif](/Article/1.gif)
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