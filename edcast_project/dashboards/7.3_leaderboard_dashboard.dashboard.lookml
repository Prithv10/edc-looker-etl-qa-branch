- dashboard: 7_3_leaderboard_dashboard
  title: 7.3 Leaderboard Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: E1AsSMpnw3wYA0TT43TrHT
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","align":"center","children":[{"text":"Appendix"}],"id":1663749951409}]'
    rich_content_json: '{"format":"slate"}'
    row: 33
    col: 0
    width: 24
    height: 2
  - title: Aggregated User Score
    name: Aggregated User Score
    model: concord
    explore: leaderboard_user_agg_score_vw
    type: table
    fields: [leaderboard_user_agg_score_vw.total_score_total, leaderboard_user_agg_score_vw.user_name_and_id]
    filters:
      leaderboard_user_agg_score_vw.user_full_name: ''
    sorts: [leaderboard_user_agg_score_vw.total_score_total desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      leaderboard_user_agg_score_vw.user_full_name: User Full Name (User ID)
      leaderboard_user_agg_score_vw.total_score_total: Total Score
      leaderboard_user_agg_score_vw.user_name_and_id: User Name (User ID)
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    listen:
      Is Org Email?: leaderboard_user_agg_score_vw.is_org_email
      Excluded From Leaderboard (Yes / No): leaderboard_user_agg_score_vw.excluded_from_leaderboard
      User Account Status: leaderboard_user_agg_score_vw.user_account_status
    row: 22
    col: 0
    width: 7
    height: 11
  - name: Trailing 6 Months Score by User
    title: Trailing 6 Months Score by User
    model: concord
    explore: leaderboard_data_part2_final_vw
    type: looker_line
    fields: [leaderboard_data_part2_final_vw.date_month, leaderboard_data_part2_final_vw.user_name_and_id,
      leaderboard_data_part2_final_vw.score_beast]
    pivots: [leaderboard_data_part2_final_vw.user_name_and_id]
    fill_fields: [leaderboard_data_part2_final_vw.date_month]
    filters:
      leaderboard_data_part2_final_vw.score: ">0"
      leaderboard_data_part2_final_vw.date_month: 6 months
      leaderboard_data_part2_final_vw.excluded_from_leaderboard: 'No'
    sorts: [leaderboard_data_part2_final_vw.user_name_and_id, leaderboard_data_part2_final_vw.score_beast
        desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: leaderboard_data_part2_final_vw.score_beast,
            id: leaderboard_data_part2_final_vw.score_beast, name: Score Beast}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_datetime_label: "%Y-%b"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Choose Date Range: leaderboard_data_part2_final_vw.date_date
      Is Org Email?: leaderboard_data_part2_final_vw.is_org_email
      User Account Status: leaderboard_data_part2_final_vw.user_account_status
    row: 11
    col: 0
    width: 24
    height: 11
  - name: User Score, Skills, Group Details
    title: User Score, Skills, Group Details
    model: concord
    explore: leaderboard_data_part2_final_vw
    type: looker_grid
    fields: [leaderboard_data_part2_final_vw.user_name_and_id, leaderboard_data_part2_final_vw.count_skills,
      leaderboard_data_part2_final_vw.user_skills_combined, leaderboard_data_part2_final_vw.user_group_combined,
      leaderboard_data_part2_final_vw.count_groups, leaderboard_data_part2_final_vw.score_beast]
    filters:
      leaderboard_data_part2_final_vw.excluded_from_leaderboard: 'No'
    sorts: [leaderboard_data_part2_final_vw.score_beast desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", leaderboard_data_part2_final_vw.user_name_and_id,
      leaderboard_data_part2_final_vw.count_groups, leaderboard_data_part2_final_vw.count_skills,
      leaderboard_data_part2_final_vw.user_skills_combined, leaderboard_data_part2_final_vw.user_group_combined]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      leaderboard_data_part2_final_vw.count_skills: Skills
      leaderboard_data_part2_final_vw.user_name_and_id: User Name (User ID)
      leaderboard_data_part2_final_vw.user_skills_combined: Skill Names
      leaderboard_data_part2_final_vw.user_group_combined: Group Names
      leaderboard_data_part2_final_vw.count_groups: Groups
    series_column_widths:
      leaderboard_data_part2_final_vw.count_groups: 97
      leaderboard_data_part2_final_vw.count_skills: 88
      leaderboard_data_part2_final_vw.user_name_and_id: 209
    series_cell_visualizations:
      leaderboard_data_part2_final_vw.count_skills:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    hidden_fields: [leaderboard_data_part2_final_vw.score_beast]
    listen:
      Choose Date Range: leaderboard_data_part2_final_vw.date_date
      Is Org Email?: leaderboard_data_part2_final_vw.is_org_email
      User Account Status: leaderboard_data_part2_final_vw.user_account_status
    row: 22
    col: 7
    width: 17
    height: 11
  - title: Daily Score & Skills Detail
    name: Daily Score & Skills Detail
    model: concord
    explore: leaderboard_data_part2_final_vw
    type: table
    fields: [leaderboard_data_part2_final_vw.score, leaderboard_data_part2_final_vw.date_date,
      leaderboard_data_part2_final_vw.score_overall, leaderboard_data_part2_final_vw.user_skills_combined,
      leaderboard_data_part2_final_vw.user_name_and_id]
    filters:
      leaderboard_data_part2_final_vw.excluded_from_leaderboard: 'No'
      leaderboard_data_part2_final_vw.skill: ''
    sorts: [leaderboard_data_part2_final_vw.date_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      leaderboard_data_part2_final_vw.user_full_name: User Full Name (User ID)
      leaderboard_data_part2_final_vw.user_skills_combined: Skills
      leaderboard_data_part2_final_vw.date_date: Date
      leaderboard_data_part2_final_vw.user_name_and_id: User Name (User ID)
      leaderboard_data_part2_final_vw.score_overall: Score Overall
      leaderboard_data_part2_final_vw.score: Score
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    listen:
      Choose Date Range: leaderboard_data_part2_final_vw.date_date
      Is Org Email?: leaderboard_data_part2_final_vw.is_org_email
      User Account Status: leaderboard_data_part2_final_vw.user_account_status
    row: 35
    col: 0
    width: 12
    height: 10
  - title: Top 20 Learners by Score
    name: Top 20 Learners by Score
    model: concord
    explore: leaderboard_data_part2_final_vw
    type: looker_bar
    fields: [leaderboard_data_part2_final_vw.user_full_name, leaderboard_data_part2_final_vw.max_score_total]
    filters:
      leaderboard_data_part2_final_vw.excluded_from_leaderboard: 'No'
    sorts: [leaderboard_data_part2_final_vw.max_score_total desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: leaderboard_data_part2_final_vw.total_score,
            id: leaderboard_data_part2_final_vw.total_score, name: Total Score}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    font_size: 10px
    series_types: {}
    series_colors:
      leaderboard_data_part2_final_vw.total_score: "#27E3C7"
      leaderboard_data_part2_final_vw.score_total: "#81E4CE"
      leaderboard_data_part2_final_vw.max_score_total: "#27E3C7"
    series_labels:
      leaderboard_data_part2_final_vw.max_score_total: Score Total
    label_color: [grey]
    defaults_version: 1
    hidden_fields: []
    listen:
      Choose Date Range: leaderboard_data_part2_final_vw.date_date
      Is Org Email?: leaderboard_data_part2_final_vw.is_org_email
      User Account Status: leaderboard_data_part2_final_vw.user_account_status
    row: 0
    col: 0
    width: 24
    height: 11
  filters:
  - name: Choose Date Range
    title: Choose Date Range
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: concord
    explore: leaderboard_data_part2_final_vw
    listens_to_filters: []
    field: leaderboard_data_part2_final_vw.date_date
  - name: Is Org Email?
    title: Is Org Email?
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: concord
    explore: leaderboard_data_part2_final_vw
    listens_to_filters: []
    field: leaderboard_data_part2_final_vw.is_org_email
  - name: Excluded From Leaderboard (Yes / No)
    title: Excluded From Leaderboard (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: leaderboard_user_agg_score_vw
    listens_to_filters: []
    field: leaderboard_user_agg_score_vw.excluded_from_leaderboard
  - name: User Account Status
    title: User Account Status
    type: field_filter
    default_value: active
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: leaderboard_data_part2_final_vw
    listens_to_filters: []
    field: leaderboard_data_part2_final_vw.user_account_status
