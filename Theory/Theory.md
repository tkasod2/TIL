# AI
## 개요
- AI란? @@데이터를 통해, @@모델을 만들고, @@기능을 만든다
    - 모델 : 데이터에 대한 설명 방법
    - 종류 :
        > Artificial (????) Intellgince  
        > ANI (Narrow) : 약한 AI, 특정분야에서만    
        > AGI (General) : 강한 AI, 인간 만큼의 지능   
        > ASI (super) : 인간을 뛰어 넘는 지능. 
    - 중요 키워드 : Auto ML
    - 데이터 종류 : 정형 / 반정형(log, Sensor, )/ 비정형(이미지, 비디오, 사운드, Document)
        - **그래봤자, 결국 정형데이터 처리 기법으로 처리한다.**
    

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

- Overfitting, Generalrization
    - Cross Validation : 
        - K-fold CV : **Startified (층화)**
            - Test Data를 일정 비율 떼고,
                - Train + Validation Data를 K등분
                - 한번씩 돌아가면서 K phase만큼 학습하고, (**Phase마다 모델을 초기화됨.**)
            - K 번을 반복하고 평균값을 사용
            - 목적은, **평가**시에 Train Data에 Overfitting되는것을 방지하는게 첫번째, Hyper Parameter Tuning이 두번째

- Supervised Learning
    - Linear Regression : 선형 상관관계를 모델링하는 방법
        - 2개 이상의 독립변수($x$) : "다중"회귀분석(Multivariate)
        - MSE : 평가지표, 대표적인 Cost Function
            - ${x_i}$ : i번째, 관측치. $\hat{x_i}$ : i 번째 예측치(회귀를 통한 예측)
            - ${x_i}$-$\hat{x_i}$ = $error_{i}$
            - $\frac{\sum_{i = 1}^{...} error_{i}^{2}}{n}$ : MSE
            - 해당 Cost Function의 최소화를 시키는 Parmeter ${\theta}$를 찾는것.

<!-- $\hat{x}$  $\tilde{x}$, $\vec{x}$ $\overline{x}$ -->
<!-- https://rpruim.github.io/s341/S19/from-class/MathinRmd.html -->



