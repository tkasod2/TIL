### eTaPR(enhanced Time-series Aware Precision and Recall for anomaly Detection)
https://dacon.io/competitions/official/235757/talkboard/404109?page=1&dtype=recent
- 일반적인 이상탐지
    - recall과 precision을 기반으로 정확도 평가
- 시계열 데이터의 이상탐지(eTaPR나온 배경)
    - 보통 anomal이 발생하는 상황은 **지속**됨.
    - 따라서, 탐지성공/실패의 일반적인 평가에 **범위(range)**개념이 섞어야됨
        - ex ) t1,t2,... tn , t7에서 이상상황 발생되고 t11까지 지속
    - 즉, Window함수를 쓰는 이유는 여기에 있음.
    - Anomaly상황에 대해서 window가 겹치는 부분이 많을수록 detect할 확률이 높음(7page)
    - Window를 줄이는 방안을 생각해봐야함 (9page)
    - 최종 점수
        - eTaR : 모든 anomaly가 탐지될 가능성
        - eTaP : 예측모델이 예측을 옳게하는 비율
        - eTaF1 : eTaP와 eTaR의 조화평균
