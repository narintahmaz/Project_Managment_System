CREATE TABLE projects
(project_id int unique not null,
project_name varchar2(100) not null,
business_partner varchar2(100) not null,
explanation varchar2(2000) not null
)
