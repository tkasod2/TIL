## ML vs DL
![image](https://miro.medium.com/max/724/1*85gM03JgUpDEQO8JKl9VpA.png)

![image](https://ars.els-cdn.com/content/image/1-s2.0-S1350946218300119-gr4.jpg)

- ML : 사람이 Feautre를 선정하고, Engineering을 한 데이터로 학습을 진행한다.
- DL : Input Data에 대한 Feature Extraction과 분석과정이 모델(NN)안에서 진행된다.
- *즉, 데이터 input에서의 가공 여부가 가장 큰 차이점*

- c.f) 직무에 대한 소개
    - Data Engineer 
        - Data Pipeline을 구축하는 업무
        - 바로 분석을 할 수 있게 데이터를 전달해주는 역할
    - Business Analyst(Data Analyst)
        - 산업공학 기반
        - 모델링보다는 시각화를 통해 의사결정을 돕는 업무
        - 태블로, POWER BI
    - Machine Learning Researcher(Data Scientist)
        - 연구가 메인
        - 이론과 응용측면으로 나뉨
        - 학력을 굉장히 많이 따짐
- c.f) 공부 소스
[머신러닝 단기집중과정(15hr)](https://developers.google.com/machine-learning/crash-course/ml-intro)
[일주일에 논문 한개씩(PR12)](https://www.youtube.com/watch?v=auKdde7Anr8&list=PLlMkM4tgfjnJhhd4wn5aj8fVTYJwIpWkS)

## Machine Learning
- 정의 : 어떠한 과제 **T**ask는, **P**erformance measure 평가받고, **E**xperience를 통해 학습하는 프로그램.
- 분류

  - Supervised Learning : 정답을 예측. classification, regression
  - Un-supervised Learning : 규칙성 찾기
  - Reinforcement Learning : 1)**상태**와 2)**행동** 사이의 상호작용을 통해, 3)환경으로부터 받는 **보상**을 최대화 하기 위한 4) **행동정책**을 찾는 알고리즘

- Data Split @ sklearn.model_selection.train_test_split
  - Train data : Learning 목적
  - Validation data : Hyper Params tuning, **Model Select** 목적
  - Test data : Evaluate 목적

- Overfitting and Generalization
    - Capacity 극대화 (즉, Feature;차원이 너무 큰 경우)
    - ➡ Overfitting 발생
    - ➡ Generalization Error 증가 (즉, test loss 커짐)
    - ➡ New data에 대한 대응력 부족
    - ➡ 대응 방법 : Data 추가확보, Regularization(L1, L2), Drop-out & Batch Normalizaion; BN (딥러닝에서.), HPO, C.V.
        - Cross Validation (교차검증)
            - (Stratified;층화적) K-Fold CV
                    - Test Data를 일정 비율 떼고,
                    - Train + Validation Data를 K등분
                    - 한번씩 돌아가면서 K phase만큼 학습하고, (**Phase마다 모델을 초기화됨.**)
                - K 번을 반복하고 평균값을 사용
                - 목적은, **평가**시에 Train Data에 Overfitting되는것을 방지하는게 첫번째, Hyper Parameter Tuning이 두번째
- Gradient Descent Algorithm (경사하강법)
    - Cost Function : 가장 적합한 Parameter $\theta$ 를 찾기위해,  $\hat{y}$ 와, $y$의 차이를 기반으로 모델 성능 지표를 찾는걸 도와주는 함수
    - cost func의 Gradient(기울기)를 기반으로 어느방향으로 이동하면 cost값을 최소화할 수 있는지 찾아가는 방식
    > 의문? 미분계수 0인걸 비교하면 되지 않나?  
    >  컴퓨터가 미분계수를 구하는 계산하는것이 어렵고, 비선형함수나, 다중회귀식이나, 아예 닫힌상태가 아닌경우에는 너무 빡셈
    - MSE : 평가지표, 대표적인 Cost Function
      - ${x_i}$ : i번째, 관측치. $\hat{x_i}$ : i 번째 예측치(회귀를 통한 예측)
      - ${x_i}$-$\hat{x_i}$ = $error_{i}$
      - $\frac{\sum_{i = 1}^{...} error_{i}^{2}}{n}$ : MSE
      - 해당 Cost Function의 최소화를 시키는 Parmeter ${\theta}$를 찾는것.

- 종류
    - Supervised Learning (지도학습)
    - Unsupervised Learning (비지도학습)
    - Reinforcement Learning (강화학습)
    

    

## Deep Learning
![image](https://miro.medium.com/max/639/1*_Epn1FopggsgvwgyDA4o8w.png)

- Activation Function
    - 왜 쓰는가? weight와 sum을 통한 NN 모델은 결국 **선형결합(Linear combination)**
    - 그럼, 결국 비선형의 패턴을 가진 데이터에대해서는 설명이 불가능함
    - 따라서, 비선형 함수인 Activation Function을 통과시켜서 데이터에 대한 이해도를 높이는거
- 모델의 구분
    - MLP, SLP (Mulit/Single Layer Perceptron)
        - SLP : AND, OR에 대한 설명만 가능. XOR에 대한 설명이 불가능
        - MLP : XOR(두 데이터의 값이 동일하면 0, 같지않으면 1을 뱉어내는 판별)의 설명을 위해 나타남.
    - ANN
        - Forward Propagation (Feedforward NN) : costfunction의 cost를 낮추도록 Gradient Descent를 적용하여, 원하는 결과를 얻어내기위한 적절한 $\theta$ 를 구하는 방식
            - Layer의 복잡도가 커질수록, 연산이 너무 복잡해짐!
            - 과거데이터(input 단에 가까운애들)에 대한 기억이 상실될 가능성 큼.
        - Back Propagation : Forward 학습을 한번 하고, error(학습된 출력값 - 실제값)를 계산하여 역방향으로 전파하는 알고리즘
            - 틀린 정도(error)의 gradient(기울기)값을 역으로 계산해나가면서, G.D를 적용하고 적절한 $\theta$ 를 갱신하게함
                - Gradient Vanishing / Gradient Explode
        - http://playground.tensorflow.org/




