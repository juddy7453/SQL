-- CP 03 ������ �м��� �ʿ��� SQL
-- 2. ����(JOIN)


USE EDU


-- INNER JOIN : ����� ��ҵ��� ���� �����ϴ� ���� ���
SELECT *
	FROM [Member] AS A -- [Member] ���̺� ��Ī A
	INNER
	JOIN [Order] AS B -- [Order] ���̺� ��Ī B
	ON A.mem_no = B.mem_no -- ���� ��(mem_no) ����


-- LEFT JOIN : ���� ���̺� ���� ������ ��ȸ
SELECT *
	FROM [Member] A -- ���� ���̺�
	LEFT
	JOIN [Order] B -- ������ ���̺�
	ON A.mem_no = B.mem_no


-- CROSS JOIN : �� ���̺��� ���� ������ ������ ��ȸ
-- [Member] �� X [Order] ��
SELECT *
	FROM [Member] A
	CROSS
	JOIN [Order] B
	WHERE A.mem_no = '1000001'
	-- mem_no�� [Member] �� [Order]���� �����Ƿ�, A.mem_no �Ǵ� B.mem_no�� ����ؾ� ��


-- SELF JOIN : �� ���̺�(Member)�� �� ���̺�(A, B)�� �Ͽ� ���� ������ ������ ��ȸ
-- [Member] �� X [Member] ��
SELECT *
	FROM [Member] A, [Member] B
	WHERE A.mem_no = '1000001'
	-- mem_no�� [Member]�� A, B�� �����Ƿ�, A.mem_no �Ǵ� B.mem_no�� ����ؾ� ��