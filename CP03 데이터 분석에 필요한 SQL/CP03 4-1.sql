-- CP03 ������ �м��� �ʿ��� SQL
-- ��ġ��

-- 1. [Order] ���̺��� ��� ���� ��ȸ�Ͽ���.
SELECT *
	FROM [Order]

-- 2. [shop_code]�� 30 �̻����θ� �����Ͽ���.
SELECT *
	FROM [Order]
	WHERE [shop_code] >= 30

-- 3. [mem_no]�� [sales_amt] �հ踦 ���Ͽ���.
SELECT SUM([sales_amt]) AS tot_amt
	FROM [Order]
	WHERE [shop_code] >= 30
	GROUP BY [mem_no]

-- 4. [sales_amt] �հ谡 100000 �̻����θ� �����Ͽ���.
SELECT SUM([sales_amt]) AS tot_amt
	FROM [Order]
	WHERE [shop_code] >= 30
	GROUP BY [mem_no]
	HAVING SUM([sales_amt]) >= 100000

-- 5. [sales_amt] �հ谡 ���� ������ �����Ͽ���.
SELECT SUM([sales_amt]) AS tot_amt
	FROM [Order]
	WHERE [shop_code] >= 30
	GROUP BY [mem_no]
	HAVING SUM([sales_amt]) >= 100000
	ORDER BY SUM(sales_amt) DESC;
