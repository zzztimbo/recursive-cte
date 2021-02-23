.header on
.mode column
.width auto

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

with recursive parents as (
  select id,
         name, 
         parent_id,
         0 as relative_depth
   from fam_tree
  where name = 'Grandchild A1b'

  union all

  select ft.id, 
         ft.name, 
         ft.parent_id,
         p.relative_depth - 1
    from fam_tree ft 
    join parents p  
      on p.parent_id = ft.id 
)

select * from parents;