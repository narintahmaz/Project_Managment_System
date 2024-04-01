CREATE OR REPLACE PROCEDURE populate_team(
    p_project_id IN NUMBER,
    p_role_names IN string_array,
    p_employee_names IN string_array
)
AS
    team_seq_val NUMBER;
BEGIN
   
    SELECT team_seq.NEXTVAL INTO team_seq_val FROM DUAL;

    IF p_role_names.COUNT <> p_employee_names.COUNT THEN
        RAISE_APPLICATION_ERROR(-20001, 'Number of roles and employees should be the same');
    END IF;

    FOR i IN 1..p_role_names.COUNT LOOP
        INSERT INTO project_team (team_id, role_name, employee_name, project_id)
        VALUES (team_seq_val, p_role_names(i), p_employee_names(i), p_project_id);
    END LOOP;

    COMMIT;
END;



DECLARE
    roles string_array := string_array('Role2', 'Role3', 'Role4');
    employees string_array := string_array('Employee2', 'Employee3', 'Employee4');
BEGIN
    populate_team(p_project_id => 123, p_role_names => roles, p_employee_names => employees);
END;
/

Create table project_team
(team_id number,
role_name varchar2(50),
employee_name varchar2(50),
project_id number )



