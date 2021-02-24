.header on
.mode column
.width 5 10 20 10 

create table fam_tree(
  id integer,
  name TEXT,
  parent_id integer
);

insert into fam_tree values
  (1, 'Root A', null),
  (2, 'Root B', null),
  (3, 'Child A1', 1),
  (4, 'Child A2', 1),
  (5, 'Child B1', 2),
  (6, 'Child B2', 2),
  (7, 'Grandchild A1a', 3),
  (8, 'Grandchild A1b', 3)
 ;

with recursive fam_tree_with_root as (
  select id,
         parent_id,
         name, 
         name as root_name
   from fam_tree
  where parent_id is null 

  union all
  
  select ft.id, 
         ft.parent_id, 
         ft.name, 
         ftwr.root_name
    from fam_tree ft  
    join fam_tree_with_root ftwr 
      on ft.parent_id = ftwr.id
)

select * from fam_tree_with_root