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

with recursive fam_sub_tree as (
  select id,
         name, 
         1 as relative_depth
   from fam_tree
  where name = 'Child A1'

  union all

  select ft.id, 
         ft.name, 
         fst.relative_depth + 1
    from fam_tree ft 
    join fam_sub_tree fst
      on ft.parent_id = fst.id 
)

select * from fam_sub_tree;