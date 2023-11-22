-- CP04 �ǹ��� �ʿ��� SQL
--3. ��ġ��
--1) ������ ��Ʈ
USE EDU


-- [Order] ���̺��� [mem_no]�� [sales_amt] �հ� �� [order_no] ����
-- (���� : [order_date]�� 2020�� | �� �̸� : [sales_amt] �հ�� [tot_amt]/[order_no] ������ [tot_tr])


SELECT mem_no, SUM(sales_amt) AS tot_amt, COUNT(order_no) AS tot_tr
	FROM [Order]
	WHERE YEAR(order_date) = 2020
	GROUP BY mem_no

--2. [Member] ���̺��� �������� �Ͽ� (1) ���̺� LEFT JOIN
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
			
--3. (2)�� Ȱ���Ͽ� ���ſ��� �� �߰�
SELECT *,
	CASE WHEN N.tot_tr IS NOT NULL THEN 1
		ELSE 0 END AS ���ſ���
		  
	FROM([Member] M
		LEFT 
		JOIN 
		(SELECT mem_no, SUM(sales_amt) AS tot_amt, COUNT(order_no) AS tot_tr
			FROM [Order]
			WHERE YEAR(order_date) = 2020
			GROUP BY mem_no
			) N
		ON M.mem_no = N.mem_no)

--4. (3)�� ��ȸ�� ��� ���̺� ����
SELECT M.*,
	CASE WHEN N.tot_tr IS NOT NULL THEN 1
		ELSE 0 END AS ���ſ���
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
		




