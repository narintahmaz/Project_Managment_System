CREATE OR REPLACE PROCEDURE GetActionPlanByStageName(stageName IN VARCHAR2)
AS
    CURSOR action_plan_cursor IS
        SELECT p.task_id, p.task_name, p.executor, p.start_date, p.end_date,
               p.period_of_execution, p.pointer_of_execution, p.deadline,
               p.status, p.notes
        FROM project_action_plan p
        JOIN project_stages s ON p.stage = s.stage_name
        WHERE s.stage_name = stageName;

    TYPE projclist IS TABLE OF action_plan_cursor%ROWTYPE;
    plan_list projclist := projclist();  

    v_plan_record action_plan_cursor%ROWTYPE;  
    
BEGIN
    OPEN action_plan_cursor;
    
    LOOP
        FETCH action_plan_cursor INTO v_plan_record;  
        EXIT WHEN action_plan_cursor%NOTFOUND;
        
        plan_list.extend;  
        plan_list(plan_list.count) := v_plan_record;  
    END LOOP;
    
    CLOSE action_plan_cursor;


END GetActionPlanByStageName;
/




