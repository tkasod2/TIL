# RNN 개념
- 대상 Data : Sequence Data  
![image](./image/RNN1.png)
- weight는 epoch이 끝나기전까지는 다 똑같다.
    ![image](./image/RNN2.png)
    ![image](./image/RNN3.png)


![image](./image/RNN4.png)

- [BPTT](http://solarisailab.com/archives/1451)


- why "tanh" activation function?
    - Gradient Vanishing때문에, 미분값의 range가 가장 넓은(0~1) tanh를 RNN에서는 애용함
