--1

insert into "OPTION" (TEXT, QUESTION_FK) VALUES ("azzzsd", 4);


--2
update "QUESTION_SET"
set name = "bbbbbb"
where id = 1;


--3
delete from "QUESTION_SET" 
where id not in (select distinct QUESTION_SET_FK from "QUESTION");
