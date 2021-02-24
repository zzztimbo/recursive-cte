.header on
.mode column
.width auto

with recursive num_range as (
  select 1 as num

  union all

  select num + 1
    from num_range
   where num < 100 
)

select * from num_range;