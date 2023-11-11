-- CP04 실무에 필요한 SQL
-- 1. 자주 쓰이는 SQL 문법


-- 1) 비교 연산자
-- [Member] 테이블의 [addr]이 'seoul'이 아닌 값만 조회하여라.
SELECT *
	FROM [Member]
	WHERE addr <> 'seoul'


-- 2) 논리 연산자
-- [Member] 테이블의 [gender]가 'man' 및 [ageband]가 20인 값만 조회하여라.
SELECT *
	FROM [Member]
	WHERE gender = 'man'
		AND ageband = 20

-- [Member] 테이블의 [gender]가 'man' 및 [ageband]가 20인 값과 또는 [addr]이 'seoul'인 값을 조회하여라.
SELECT *
	FROM [Member]
	WHERE (gender = 'man' AND ageband = 20)
		OR (addr = 'seoul')


-- 3) 특수 연산자
-- [Member] 테이블에서 [ageband]가 20~40인 값만 조회하여라.
SELECT *
	FROM [Member]
	WHERE ageband BETWEEN 20 AND 40

-- [Member] 테이블에서 [addr]이 'ae'를 포함하는 값만 조회하여라.
-- 내가 짠 코드
SELECT *
	FROM [Member]
	WHERE 'ae' IN (addr)

-- 모범 답안
SELECT *
	FROM [Member]
	WHERE addr LIKE '%ae%'


-- 4) 산술 연산자
-- [Order] 테이블에서 [sales_amt]를 0.1로 곱셈하여라. (열 이름 : fees)
SELECT sales_amt * 0.1 AS fees
	FROM [Order]
	
-- [Order] 테이블에서 [sales_amt]에 [sales_amt]를 0.1로 곱셈한 값을 뺄셈하여라. (열 이름 : Excluding_fees)
SELECT sales_amt - (sales_amt * 0.1) AS Excluding_fees
	FROM [Order]
