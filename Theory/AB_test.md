## # A/B Test : 새로 고안하는 B 방법에 대해서, 기존 사용하던 방법 A와 1:1로 통계학적 비교를 하는 Test

봐볼만한 사이트 목록
- [블로그](https://spoqa.github.io/2012/05/15/ab-testing-basic.html)


### # 1번 예시, web site 시간 a, b의 비교

```python
web_a = pd.DataFrame([20.5, 12.6, 19.5, 18.8, 13.4, 13.5, 17.5, np.nan, 12.8, 17.8, np.nan, 23.1, 10.6, np.nan, 11.5], 
                    columns=['Duration_A'])
web_b = pd.DataFrame([11.8, 10.7, np.nan, 12.5, np.nan, 14.9, 12.1, 13.9, 10.3, 9.0, 13.3, 12.4, 12.5], 
                columns=['Duration_B'])
```

우선 위와 같은 예시가 있다고 가정하자. web site a, b 각각의 체류시간에 대한 데이터다.  
그리고, 이 두 데이터에 대해서, 독립표본 t-test를 한 결과를 보자  
   
```python
stats.ttest_ind(web_a["Duration_A"].values, # 해당 열의 '값들' .values 안써도 됨 (Null, 한글 없어서 괜춚)
            web_b["Duration_B"].values, # 해당 열의 '값들'
            equal_var=False) # A, B의 분산을 같다고 가정할지, 그러지 않을지.
# output
Ttest_indResult(statistic=3.0165632092150694, pvalue=0.008734970056646718)
```

결과적으로 봤을때, B에서의 체류시간이 상대적으로 적다는것을 알 수 있다.

### # 2번 예시, 배너를 누르는지에 대한 A/B test

- **사전지식**  
    - Conversion rate (전환율)~구매여부, 회원가입 : a metric, shown as a percentage, that displays how many website or app visitors complete an action out of the total number of visitors.  
    - Click-Through Rate (CTR, 클릭율)~노출대비 클릭수 : a metric, shown as a percentage, that measures how many people clicked your ad to visit a website or landing page.


```python
a_clicked = 144 # 버튼(배너) 시안 A를 누른 유저의 수
a_unclicked = 2362 # 버튼(배너) 시안 A를 보았으나 누르지 않은 유저의 수

b_clicked = 212 # 버튼(배너) 시안 B를 누른 유저의 수
b_unclicked = 2528 # 버튼(배너) 시안 B를 보았으나 누르지 않은 유저의 수

click_df = pd.DataFrame({'Clicked':[a_clicked, b_clicked], 
                        'Unclicked':[a_unclicked, b_unclicked]}, index=['Button_A', 'Button_B'])
```


```python
# 단순한 전환율 및 클릭율 계산 
# : 실제 클릭 수 / 전체 노출 수 * 100

conversion_rate = click_df['Clicked'] / (click_df['Clicked'] + click_df['Unclicked']) * 100
# print(conversion_rate)

print("Button(or Banner Ad) A's Conversion Rate(or CTR) is : {:0.2f}%".format(conversion_rate[0]))
print("Button(or Banner Ad) B's Conversion Rate(or CTR) is : {:0.2f}%".format(conversion_rate[1]))
```

Button A와 B에 따라서, 과연 클릭률의 차이가 있는지 확인해보자  
chi2_contigency 함수(chi-sqaured 검정)를 이용하자  

```python
# "Chi-square" test of independence of variables in a "contingency" table.
print(stats.chi2_contingency([click_df['Clicked'], click_df['Unclicked']]))

stats.chi2_contingency([click_df['Clicked'], click_df['Unclicked']])[1] # 2번째 return 값이 p-value에 해당

# output
(7.890855736993352, 0.004968535119697213, 1, array([[ 170.06023637,  185.93976363],
       [2335.93976363, 2554.06023637]]))
0.004968535119697213 # pvalue임

```
결과적으로, p-value가 0.00496... 으로 0.05보다 작으므로(95%신뢰구간의 경우) A와 B의 통계적인 독립성을 검증하게 됨. 


### # P-hacking에 대해서
- p-value에 매몰된 사고를 하면 안됨
- 실제로, 여러 논문들이 이걸로 사기를 치고있음
- 실효성에 대한 검증은 다차원적으로 진행해야함
