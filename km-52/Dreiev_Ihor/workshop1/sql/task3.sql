delete from "QUESTION_SET" 
where id not in (select distinct QUESTION_SET_FK from "QUESTION");
