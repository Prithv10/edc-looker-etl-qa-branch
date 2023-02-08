-- get user metadata basis the latest timestamp
-- cf_0_latest_metadata_vw

select user_id, custom_field_id, value, display_name,
    case
        when regexp_contains(abbreviation, '^[0-9]')

        then concat('_', abbreviation)

        when regexp_contains(abbreviation, 'user_id')

        then concat(abbreviation,'_custom_field')

        else abbreviation

    end as abbreviation,
    row_n
from
    (
        select user_id, custom_field_id, value, display_name, abbreviation,
            row_number() over (
                partition by concat(user_id, custom_field_id) order by updated_at desc
            ) as row_n
        from
            {{ref('user_custom_fields_dim_m_v')}}
        qualify row_n = 1
    )