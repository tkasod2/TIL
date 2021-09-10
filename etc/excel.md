## Excel 기본 정리
### 주요 단축키
- ctrl + 1
    > 서식선택. 특히 테두리, 표시형식 변경
- ctrl + space 
    > 컬럼 선택
- shift + space
- ctrl + shift + l
    > 필터 걸기
- 설정 단축키
    - alt+ num
        > 2 값붙여넣기<br>
        > 8 수식붙여넣기<br>
        > 9 서식붙여넣기<br>
- ctrl + "+"
- shift + "+"
- ctrl + 0
- ctrl + 9
- alt + shift + →
- alt + shift + ←
- 함수 + F4
    - $가 앞에 붙으면 해당 행 or 열이 묶이는거임
        >$A1 이면 A는 안움직이고, 1만 움직임 즉, A1~A9999까지 쭉 끌었을때 동일한 참조 거리(?)를 가지게 됨.

### 함수
- vlookup
- index + match
- sumifs
- countifs
- averageifs
- left, right, mid

- vlookup vs index + match
    - index + match 추천
        > vlookup은 참조값이 table에서 찾은 값 기준, 왼쪽 컬럼에 있지 않으면 못찾음

- index vs offset
    - 편의대로 하시오.
    - offset은 시작지점을 첫 hyper parameter로 넣음
    - index는 참조 array를 설정

### 추가
- 데이터 유효성 검사를 통한 드롭다운 만들기
