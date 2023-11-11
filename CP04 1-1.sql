-- CP04 �ǹ��� �ʿ��� SQL
-- 1. ���� ���̴� SQL ����


-- 1) �� ������
-- [Member] ���̺��� [addr]�� 'seoul'�� �ƴ� ���� ��ȸ�Ͽ���.
SELECT *
	FROM [Member]
	WHERE addr <> 'seoul'


-- 2) �� ������
-- [Member] ���̺��� [gender]�� 'man' �� [ageband]�� 20�� ���� ��ȸ�Ͽ���.
SELECT *
	FROM [Member]
	WHERE gender = 'man'
		AND ageband = 20

-- [Member] ���̺��� [gender]�� 'man' �� [ageband]�� 20�� ���� �Ǵ� [addr]�� 'seoul'�� ���� ��ȸ�Ͽ���.
SELECT *
	FROM [Member]
	WHERE (gender = 'man' AND ageband = 20)
		OR (addr = 'seoul')


-- 3) Ư�� ������
-- [Member] ���̺��� [ageband]�� 20~40�� ���� ��ȸ�Ͽ���.
SELECT *
	FROM [Member]
	WHERE ageband BETWEEN 20 AND 40

-- [Member] ���̺��� [addr]�� 'ae'�� �����ϴ� ���� ��ȸ�Ͽ���.
-- ���� § �ڵ�
SELECT *
	FROM [Member]
	WHERE 'ae' IN (addr)

-- ��� ���
SELECT *
	FROM [Member]
	WHERE addr LIKE '%ae%'


-- 4) ��� ������
-- [Order] ���̺��� [sales_amt]�� 0.1�� �����Ͽ���. (�� �̸� : fees)
SELECT sales_amt * 0.1 AS fees
	FROM [Order]
	
-- [Order] ���̺��� [sales_amt]�� [sales_amt]�� 0.1�� ������ ���� �����Ͽ���. (�� �̸� : Excluding_fees)
SELECT sales_amt - (sales_amt * 0.1) AS Excluding_fees
	FROM [Order]
