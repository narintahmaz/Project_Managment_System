CREATE OR REPLACE PROCEDURE insert_project_action_plan(
   
     p_stage IN VARCHAR2,
     p_task_name IN VARCHAR2 ,
     p_executor IN VARCHAR2,
     p_start_date IN  DATE,
     p_end_date IN  DATE,
     p_period_of_execution IN VARCHAR2 ,
     p_pointer_of_execution IN VARCHAR2,
     p_deadline IN DATE,
     p_status IN  VARCHAR2,
     p_notes IN VARCHAR2
) 
AS

BEGIN
    INSERT INTO project_action_plan (
        task_id,
        stage,
        task_name,
        executor,
        start_date,
        end_date,
        period_of_execution,
        pointer_of_execution,
        deadline,
        status,
        notes
    ) VALUES (
      task_id_seq.NEXTVAL,
        p_stage,
        p_task_name,
        p_executor,
        p_start_date,
        p_end_date,
        p_period_of_execution,
        p_pointer_of_execution,
        p_deadline,
        p_status,
        p_notes
    );
END insert_project_action_plan ;

