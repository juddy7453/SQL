-- CP03 데이터 분석에 필요한 SQL
-- 4-2 데이터 조회(SELECT) + 결합(JOIN) + 서브 쿼리(Sub Query)

-- 1. [Order] 테이블의 [mem_no]별 [sales_amt] 합계를 구하여라.
SELECT SUM(sales_amt) AS tot_amt
	FROM [Order]
	GROUP BY mem_no


-- 2. (1)을 FROM절 서브 쿼리를 사용하여, [Member] 테이블을 LEFT JOIN 하여라.
-- 내가 짠 코드
SELECT SUM(sales_amt) AS tot_amt
	FROM ([Order] A
		LEFT JOIN [Member] B
		ON A.mem_no = B.mem_no)
	GROUP BY A.mem_no

-- 모범답안
SELECT *
	FROM (
		SELECT mem_no, SUM(sales_amt) AS tot_amt
			FROM [Order]
			GROUP BY mem_no
		 )A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no


-- 3. [gender], [addr]별 [tot_amt] 합계를 구하여라.
SELECT gender, addr, SUM(tot_amt) AS 합계 
	FROM (
		SELECT mem_no, SUM(sales_amt) AS tot_amt
			FROM [Order]
			GROUP BY mem_no
		 )A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY gender, addr