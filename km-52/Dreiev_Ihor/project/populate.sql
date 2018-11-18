insert into User (id, NAME, USERNAME, EMAIL, PASSWORD_HASH) VALUES 
(1, "asd", "asd", "asd@gmail.com", "asd"),
(2, "asddd", "asddd", "asddd@gmail.com", "asddd"),
(3, "zzxcx", "zzxcx", "zzxcx@gmail.com", "zzxcx"),
(4, "azzzsd", "azzzsd", "azzzsd@gmail.com", "azzzsd")

insert into Question_set (PK_QUESTIONSET, NAME, CUSTOMER) VALUES
(1, "asd", 1),
(2, "asddd", 2),
(3, "zzxcx", 3),
(4, "azzzsd", 4)

insert into Question (PK_QUESTION, TEXT, QUESTION_SET) VALUES
(1, "asd", 1),
(2, "asddd", 2),
(3, "zzxcx", 3),
(4, "azzzsd", 4)

insert into Option (PK_QUESTION, TEXT, QUESTION_SET) VALUES
(1, "asd", 1),
(2, "asddd", 2),
(3, "zzxcx", 3),
(4, "azzzsd", 4)
