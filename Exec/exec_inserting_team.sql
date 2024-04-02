DECLARE
    roles string_array := string_array('Role2', 'Role3', 'Role4');
    employees string_array := string_array('Employee2', 'Employee3', 'Employee4');
BEGIN
    populate_team(p_project_id => 123, p_role_names => roles, p_employee_names => employees);
END;
/
