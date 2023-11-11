-- CP03 데이터 분석에 필요한 SQL
-- 4-2 데이터 조회(SELECT) + 결합(JOIN) + 서브 쿼리(Sub Query)

-- 1. [Order] 테이블 기준으로 [Member] 테이블을 LEFT JOIN 하여라.
SELECT *
	FROM [Order] A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY [gender]

-- 2. [gender]별 [sales_amt] 합계를 구하여라.
SELECT SUM(sales_amt) AS tot_amt
	FROM [Order] A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY [gender]	

-- 3. [gender], [addr]별 [sales_amt] 합계를 구하여라.
SELECT B.gender, B.addr,
		SUM(sales_amt) AS tot_amt
	FROM [Order] A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY gender, addr