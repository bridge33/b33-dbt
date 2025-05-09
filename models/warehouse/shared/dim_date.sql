with
    date_spine as (
        {{
            dbt_utils.date_spine(
                datepart="day",
                start_date="'1990-01-01'",
                end_date="date_add(year, 1, current_date())",
            )
        }}
    ),
    renamed as (
        select
            date_day::date as full_date,
            row_number() over (order by date_day asc) as id,
            dayofweek(date_day) + 1 as day_num_of_week,
            day(date_day) as day_num_of_month,
            datediff(date_day, trunc(date_day, 'quarter')) + 1 as day_num_of_quarter,
            dayofyear(date_day) as day_num_of_year,
            case
                when dayofweek(date_day) = 1 then 'Sunday'
                when dayofweek(date_day) = 2 then 'Monday'
                when dayofweek(date_day) = 3 then 'Tuesday'
                when dayofweek(date_day) = 4 then 'Wednesday'
                when dayofweek(date_day) = 5 then 'Thursday'
                when dayofweek(date_day) = 6 then 'Friday'
                when dayofweek(date_day) = 7 then 'Saturday'
            end as day_of_week_name,
            date_format(date_day, 'E') as day_of_week_abbreviation,
            case
                when dayofweek(date_day) + 1 between 2 and 6
                then true
                else false
            end as is_weekday,
            case
                when dayofweek(date_day) + 1 = 7 then true else false
            end as is_last_day_of_week,
            case
                when date_day = last_day(date_day) then true else false
            end as is_last_day_of_month,
            case
                when date_day = add_months(date_trunc('quarter', date_day), 3) then true else false  
            end as is_last_day_of_quarter,
            case
                when date_day = add_months(date_trunc('year', date_day), 12) then true else false 
            end as is_last_day_of_year,
            date(date_trunc('week', date_day)) as week_of_year_begin_date,
            date_add(date_trunc('week', date_day), 6) as week_of_year_end_date,
            trunc(date_day, 'week') as week_of_month_begin_date,
            weekofyear(date_day) as week_num_of_year,
            month(date_day) as month_num_of_year,
            case
                when date_format(date_day, 'MMMM') = 'January' then 'January'
                when date_format(date_day, 'MMMM') = 'February' then 'February'
                when date_format(date_day, 'MMMM') = 'March' then 'March'
                when date_format(date_day, 'MMMM') = 'April' then 'April'
                when date_format(date_day, 'MMMM') = 'May' then 'May'
                when date_format(date_day, 'MMMM') = 'June' then 'June'
                when date_format(date_day, 'MMMM') = 'July' then 'July'
                when date_format(date_day, 'MMMM') = 'August' then 'August'
                when date_format(date_day, 'MMMM') = 'September' then 'September'
                when date_format(date_day, 'MMMM') = 'October' then 'October'
                when date_format(date_day, 'MMMM') = 'November' then 'November'
                when date_format(date_day, 'MMMM') = 'December' then 'December'
                else date_format(date_day, 'MMMM')
            end as month_name,
            date_format(date_day, 'MMM') as month_name_abbreviation,
            trunc(date_day, 'month') as month_begin_date,
            last_day(date_day) as month_end_date,
            quarter(date_day) as quarter_num_of_year,
            trunc(date_day, 'quarter') as quarter_begin_date,
            add_months(date_trunc('quarter', date_day), 3) as quarter_end_date, 
            year(date_day) as year_num,
            trunc(date_day, 'year') as year_begin_date,
            add_months(date_trunc('year', date_day), 12) as year_end_date,
            date_format(date_day, 'yyyyMM') as yyyymm,
            date_format(date_day, 'yyyyMMdd') as yyyymmdd,
            date_format(date_day, 'ddMMMMyyyy') as ddmonyyyy,
            '_original_table' as _original_table
        from date_spine
    ),
    mapped as (
        select
            r.*
        from renamed r
        -- Join for week_of_year_begin_date
        left join renamed ws on r.week_of_year_begin_date = ws.full_date
        -- Join for week_of_year_end_date
        left join renamed we on r.week_of_year_end_date = we.full_date
        -- Join for week_of_month_begin_date
        left join renamed wm on r.week_of_month_begin_date = wm.full_date
        -- Join for month_begin_date
        left join renamed mb on r.month_begin_date = mb.full_date
        -- Join for month_end_date
        left join renamed me on r.month_end_date = me.full_date
        -- Join for quarter_begin_date
        left join renamed qb on r.quarter_begin_date = qb.full_date
        -- Join for quarter_end_date
        left join renamed qe on r.quarter_end_date = qe.full_date
        -- Join for year_begin_date
        left join renamed yb on r.year_begin_date = yb.full_date
        -- Join for year_end_date
        left join renamed ye on r.year_end_date = ye.full_date
    )

select *
from mapped