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
![gif](https://info.deeplearning.ai/hs-fs/hubfs/FORGET.gif?width=1200&upscale=true&name=FORGET.gif)
- \#Textmining
- 작업에 효과적이지 않은 Token을 배제하는 Expire-Span이라는 기술을 제안 (Facebook의 Sainbayar Sukhbaatar)
- 원리 : Attention layer를 수정
    - '''Attention layer는 softmax 함수(다중클래스 분류시 사용)를 통과시킨 outputlayer'''
    1. Wikipedia의 enwik8 텍스트 데이터 세트를 사용하여 시퀀스의 다음 문자를 예측