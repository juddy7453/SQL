-- CP04 실무에 필요한 SQL
--3. 마치며
--1) 데이터 마트
USE EDU


-- [Order] 테이블의 [mem_no]별 [sales_amt] 합계 및 [order_no] 개수
-- (조건 : [order_date]는 2020년 | 열 이름 : [sales_amt] 합계는 [tot_amt]/[order_no] 개수는 [tot_tr])


SELECT mem_no, SUM(sales_amt) AS tot_amt, COUNT(order_no) AS tot_tr
	FROM [Order]
	WHERE YEAR(order_date) = 2020
	GROUP BY mem_no

--2. [Member] 테이블을 왼쪽으로 하여 (1) 테이블 LEFT JOIN
SELECT *
	FROM([Member] M
		LEFT 
		JOIN 
		(SELECT mem_no, SUM(sales_amt) AS tot_amt, COUNT(order_no) AS tot_tr
			FROM [Order]
			WHERE YEAR(order_date) = 2020
			GROUP BY mem_no
			) N
		ON M.mem_no = N.mem_no)
			
--3. (2)를 활용하여 구매여부 열 추가
SELECT *,
	CASE WHEN N.tot_tr IS NOT NULL THEN 1
		ELSE 0 END AS 구매여부
		  
	FROM([Member] M
		LEFT 
		JOIN 
		(SELECT mem_no, SUM(sales_amt) AS tot_amt, COUNT(order_no) AS tot_tr
			FROM [Order]
			WHERE YEAR(order_date) = 2020
			GROUP BY mem_no
			) N
		ON M.mem_no = N.mem_no)

--4. (3)의 조회된 결과 테이블 생성
SELECT M.*,
	CASE WHEN N.tot_tr IS NOT NULL THEN 1
		ELSE 0 END AS 구매여부
	INTO [MART_2020]	  
	FROM([Member] M
		LEFT 
		JOIN 
		(SELECT mem_no, SUM(sales_amt) AS tot_amt, COUNT(order_no) AS tot_tr
			FROM [Order]
			WHERE YEAR(order_date) = 2020
			GROUP BY mem_no
			) N
		ON M.mem_no = N.mem_no)
		




