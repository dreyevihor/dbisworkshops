CREATE OR REPLACE PACKAGE questions_sets AS
	
    TYPE question_set_record is RECORD(
        question_set_id NUMBER;
        question_id NUMBER;
        question_set_text VARCHAR2(100);
        question_text VARCHAR2(100);
        option_text VARCHAR2(100);
        );
    TYPE question_set_table IS TABLE OF question_set_record;
    
    FUNCTION get_question_set
        (user_id IN NUMBER, set_id IN NUMBER) 
        RETURN measure_table
        PIPELINED;
END;
CREATE OR REPLACE PACKAGE BODY questions_sets AS
    CREATE OR REPLACE FUNCTION get_question_set
        (user_id IN NUMBER, set_id IN NUMBER) 
        RETURN question_set_table
        PIPELINED
    IS
    res question_set_table;

        
    BEGIN
    select "QUESTIONSET"."id", "QUESTION"."id",
        "QUESTIONSET"."text", "QUESTION"."text", 
        "OPTION"."text" 
        BULK COLLECT INTO res 
        FROM "CUSTOMER" AS c 
        JOIN "QUESTIONSET" as qs ON c.id = qs.user_id and c.id =user_id
        JOIN "QUESTION" as q on qs.id = q.question_set_id and qs.id=set_id
        JOIN "OPTION" as o on o.question_id = q.id;
        return res;
    END;
    
    CREATE OR REPLACE PROCEDURE create_question_set
        (id_in in NUMBER, text_in in VARCHAR2, user_id_in in NUMBER)
        is
        begin
            INSERT INTO "QUESTIONSET" (id, text, user_id)
            VALUES(id_in, text_in, user_id_in);
    end;
    
    CREATE OR REPLACE PROCEDURE create_question
        (id_in in NUMBER, text_in in VARCHAR2, qs_id_in in NUMBER)
        is
        begin
            INSERT INTO "QUESTION" (id, text, question_set_id)
            VALUES(id_in, text_in, qs_id_in);
    end;
    
    CREATE OR REPLACE PROCEDURE create_option
        (id_in in NUMBER, text_in in VARCHAR2, q_id_in in NUMBER)
        is
        begin
            INSERT INTO "OPTION" (id, text, question_set_id)
            VALUES(id_in, text_in, q_id_in);
    end;
END;
