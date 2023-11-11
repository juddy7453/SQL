-- CP03 ������ �м��� �ʿ��� SQL
-- 4-2 ������ ��ȸ(SELECT) + ����(JOIN) + ���� ����(Sub Query)

-- 1. [Order] ���̺��� [mem_no]�� [sales_amt] �հ踦 ���Ͽ���.
SELECT SUM(sales_amt) AS tot_amt
	FROM [Order]
	GROUP BY mem_no


-- 2. (1)�� FROM�� ���� ������ ����Ͽ�, [Member] ���̺��� LEFT JOIN �Ͽ���.
-- ���� § �ڵ�
SELECT SUM(sales_amt) AS tot_amt
	FROM ([Order] A
		LEFT JOIN [Member] B
		ON A.mem_no = B.mem_no)
	GROUP BY A.mem_no

-- ������
SELECT *
	FROM (
		SELECT mem_no, SUM(sales_amt) AS tot_amt
			FROM [Order]
			GROUP BY mem_no
		 )A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no


-- 3. [gender], [addr]�� [tot_amt] �հ踦 ���Ͽ���.
SELECT gender, addr, SUM(tot_amt) AS �հ� 
	FROM (
		SELECT mem_no, SUM(sales_amt) AS tot_amt
			FROM [Order]
			GROUP BY mem_no
		 )A
	LEFT JOIN [Member] B
	ON A.mem_no = B.mem_no
	GROUP BY gender, addr