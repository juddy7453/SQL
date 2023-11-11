-- CP 02 기본에 충실한 SQL
-- 2. SQL 기본 명령어 


USE EDU


-- [회원테이블] 생성
CREATE TABLE [회원테이블] (
[회원번호] VARCHAR(20) PRIMARY KEY,
[이름]VARCHAR(20),
[성별]VARCHAR(2),
[나이]INT,
[가입금액]MONEY,
[수신동의]BIT
)


-- [회원테이블]에 [몸무게] 컬럼 추가, 데이터 형식은 REAL
ALTER TABLE [회원테이블] ADD [몸무게] REAL

SELECT * FROM [회원테이블]


-- SAVEPOINT
BEGIN TRAN

SAVE TRAN S1;
INSERT INTO [회원테이블] VALUES ('A10001', '모원서', '남', 33, 10000, 1, 77);

SAVE TRAN S2;
UPDATE [회원테이블] SET [나이] = 34 WHERE [회원번호] = 'A10001'

SELECT * FROM [회원테이블]

ROLLBACK TRAN S2;
SELECT * FROM [회원테이블]
