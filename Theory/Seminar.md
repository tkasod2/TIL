## 딥러닝에서의 Hyper Parameter에 대하여

- Batch 정규화
    <details markdown="1">
    <summary>출처</summary>  

    출처1(Batch 정규화) : https://eehoeskrap.tistory.com/430

    </details>

- Batch Size 
    <details markdown="1">
    <summary>출처</summary>  

    출처1(컴퓨터 비전 관점 Batchsize) : https://deep-learning-study.tistory.com/647
    출처2(러닝레이트& 배치사이즈) : https://honeyjamtech.tistory.com/43
    출처3(러닝레이트& 배치사이즈) : https://inhovation97.tistory.com/32
    </details>

    - 크면? Noise 감소(Batch 로 부터 Normalization을 하기때문), 학습속도 빠름 , Overfitting 위험
    - 작으면? Noise 증가, regularization 효과, step이 길어짐. local minima로 빠질 위험
    - 그러면 어쩌라고...?ㅠㅠ
        - 32~ 128 추천. [Rethinking "Batch" in BatchNorm](https://arxiv.org/pdf/2105.07576.pdf) 2021. Facebook AI Research. Yuxin Wu, Justin Johnson
            > [page6, 4-1 발췌] In this experiment, the best validation error is found at a normalization batch size of 32∼128, where the amount of noise and inconsistency provides balanced regularization.
        - 32 이상하면 말리라는 ...;;
        ![image](Yann_LeCun.png)
    - **결국 Learning Rate와 조절이 같이 되어야함.**

- Learning Rate
    <details markdown="1">
    <summary>출처</summary>  

    출처1(PyTorch가 제공하는 Learning rate scheduler 정리) : https://sanghyu.tistory.com/113
    </details>
    
    - 크면? Overshooting 현상으로 loss 발산의 위험
    - 작으면? Local Minima에 빠질 위험
    - 그러면? Learning Rate를 점차 줄여서 학습시키는 기법 활용
    - 단, 첫 lr에 대한 완벽한 방법은 없을듯.
        - LambdaLR 활용 epoch마다 곱해주는 방식
        - 추가로 StepLR, MultiStepLR, ExponentialLR, ReduceLROnPlateau 등이 있음.
        > ### pytorch code 예시(1)
        > optimizer = torch.optim.SGD(model.parameters(), lr=0.001)
        > scheduler = optim.lr_scheduler.LambdaLR(optimizer=optimizer,
                                lr_lambda=lambda epoch: 0.95 ** epoch)
        
        > ### pytorch code 예시(2)
        > lr_scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer, 0.997)
        > lr_scheduler.step()

        