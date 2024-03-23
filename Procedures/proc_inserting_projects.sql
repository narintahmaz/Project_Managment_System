CREATE OR REPLACE PROCEDURE insert_project (
    
    p_project_name IN VARCHAR2,
    p_business_partner IN VARCHAR2,
    p_explanation IN VARCHAR2
)
IS
BEGIN
    INSERT INTO projects (project_id, project_name, business_partner, explanation)
    VALUES (projects_seq.NEXTVAL, p_project_name, p_business_partner, p_explanation);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END insert_project;
/