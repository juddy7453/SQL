-- CP 02 �⺻�� ����� SQL
-- 2. SQL �⺻ ��ɾ� 


USE EDU


-- [ȸ�����̺�] ����
CREATE TABLE [ȸ�����̺�] (
[ȸ����ȣ] VARCHAR(20) PRIMARY KEY,
[�̸�]VARCHAR(20),
[����]VARCHAR(2),
[����]INT,
[���Աݾ�]MONEY,
[���ŵ���]BIT
)


-- [ȸ�����̺�]�� [������] �÷� �߰�, ������ ������ REAL
ALTER TABLE [ȸ�����̺�] ADD [������] REAL

SELECT * FROM [ȸ�����̺�]


-- SAVEPOINT
BEGIN TRAN

SAVE TRAN S1;
INSERT INTO [ȸ�����̺�] VALUES ('A10001', '�����', '��', 33, 10000, 1, 77);

SAVE TRAN S2;
UPDATE [ȸ�����̺�] SET [����] = 34 WHERE [ȸ����ȣ] = 'A10001'

SELECT * FROM [ȸ�����̺�]

ROLLBACK TRAN S2;
SELECT * FROM [ȸ�����̺�]
