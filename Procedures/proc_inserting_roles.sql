create or replace PROCEDURE insert_roles (
    
    p_role_name IN VARCHAR2
  )
IS
BEGIN
    INSERT INTO  roles (role_id,role_name)
    VALUES (roles_seq.NEXTVAL, p_role_name);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END  insert_roles ;







