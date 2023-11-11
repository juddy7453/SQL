-- CP03 ������ �м��� �ʿ��� SQL
-- 4-2 ������ ��ȸ(SELECT) + ����(JOIN) + ���� ����(Sub Query)

-- 1. [Order] ���̺� �������� [Member] ���̺��� LEFT JOIN �Ͽ���.
SELECT *
	FROM [Order] A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY [gender]

-- 2. [gender]�� [sales_amt] �հ踦 ���Ͽ���.
SELECT SUM(sales_amt) AS tot_amt
	FROM [Order] A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY [gender]	

-- 3. [gender], [addr]�� [sales_amt] �հ踦 ���Ͽ���.
SELECT B.gender, B.addr,
		SUM(sales_amt) AS tot_amt
	FROM [Order] A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY gender, addr