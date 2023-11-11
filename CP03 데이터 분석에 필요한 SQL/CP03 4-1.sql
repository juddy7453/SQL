-- CP03 데이터 분석에 필요한 SQL
-- 마치며

-- 1. [Order] 테이블의 모든 열을 조회하여라.
SELECT *
	FROM [Order]

-- 2. [shop_code]는 30 이상으로만 필터하여라.
SELECT *
	FROM [Order]
	WHERE [shop_code] >= 30

-- 3. [mem_no]별 [sales_amt] 합계를 구하여라.
SELECT SUM([sales_amt]) AS tot_amt
	FROM [Order]
	WHERE [shop_code] >= 30
	GROUP BY [mem_no]

-- 4. [sales_amt] 합계가 100000 이상으로만 필터하여라.
SELECT SUM([sales_amt]) AS tot_amt
	FROM [Order]
	WHERE [shop_code] >= 30
	GROUP BY [mem_no]
	HAVING SUM([sales_amt]) >= 100000

-- 5. [sales_amt] 합계가 높은 순으로 정렬하여라.
SELECT SUM([sales_amt]) AS tot_amt
	FROM [Order]
	WHERE [shop_code] >= 30
	GROUP BY [mem_no]
	HAVING SUM([sales_amt]) >= 100000
	ORDER BY SUM(sales_amt) DESC;
