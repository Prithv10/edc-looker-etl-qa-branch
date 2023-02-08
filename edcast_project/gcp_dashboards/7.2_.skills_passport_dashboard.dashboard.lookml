- dashboard: 7_2__skills_passport_dashboard
  title: 7.2 Skills Passport Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JxLRsyjx0NBo0isXH2lHON
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "##Welcome to the Dashboard ##\n﻿\nThis page serves as an inventory\
      \ of **self-declared** skills for users of the LXP. The data is taken from the\
      \ **Skills Passport** feature on user's profiles.  To view this platform feature\
      \ click your **profile icon** in the top right of the LXP and select **profile**.\
      \ Scroll down to where you see **skills passport** and you'll be able to see\
      \ the skills that you've declared. \n﻿\n"
    row: 0
    col: 0
    width: 12
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "##Definitions##\n﻿\n** # Skills, # AVG** show the raw number of skill\
      \ declarations across all users on the platform, and the average number of self\
      \ declared skills per user respectively. \n**Skill levels** are shown as Beginner,\
      \ Intermediate, Advanced, and Undeclared. 'Undeclared' means the user did not\
      \ select a skill level option upon skill selection. We're looking to remove\
      \ this feature and force users to declare a skill level when populating skills.\
      \ \n**Monthly skills added** shows the raw number of skill declarations for\
      \ the trailing six months. I.e. if two users declared 'python' as a skill, that\
      \ would count as two events. \nThe **word cloud** shows the top 50 skills declared\
      \ by frequency, with the size of the word in the cloud showing bigger words\
      \ for higher values and smaller words for lower values. \n﻿\nNote: These are\
      \ self-declared skills, and subject to all the discriminations and biases of\
      \ the employee. For example- Rey might be an excellent programmer, but only\
      \ gives herself a rating of 'beginner', while Poe is a more confident but less\
      \ competent programmer who gives himself a rating of 'advanced'.\n﻿"
    row: 3
    col: 0
    width: 12
    height: 7
  - name: Top Skills by Advanced Level
    title: Top Skills by Advanced Level
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: looker_pie
    fields: [u1_users_skills_vw.skill_name, u1_users_skills_vw.count_of_user_id]
    filters:
      u1_users_skills_vw.skill_level: Advanced
      u1_users_skills_vw.skill_type: Skills
      u1_users_skills_vw.user_account_status: ''
      u1_users_skills_vw.excluded_from_leaderboard: ''
    sorts: [u1_users_skills_vw.count_of_user_id desc]
    limit: 5
    column_limit: 50
    value_labels: labels
    label_type: labVal
    series_colors:
      Skill Label: "#8970BB"
      Project Management: "#D45F34"
      Sense of Urgency/ Efficiency: "#FFA355"
      Customer Interactions & Reltationships: "#90D16C"
      Presentation & Communication Skills: "#429338"
      Project Mgmt, Execution Skills/W3 Orientation: "#EA4C29"
      Attention to Details, Going the Extra Mile: "#5EA7CF"
    series_types: {}
    defaults_version: 1
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 10
    col: 13
    width: 11
    height: 8
  - name: Top Skills by Intermediate Level
    title: Top Skills by Intermediate Level
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: looker_pie
    fields: [u1_users_skills_vw.skill_name, u1_users_skills_vw.count_of_user_id]
    filters:
      u1_users_skills_vw.skill_level: Intermediate
      u1_users_skills_vw.skill_type: Skills
      u1_users_skills_vw.user_account_status: ''
      u1_users_skills_vw.excluded_from_leaderboard: ''
    sorts: [u1_users_skills_vw.count_of_user_id desc 0]
    limit: 5
    column_limit: 50
    value_labels: labels
    label_type: labVal
    series_colors:
      Skill Label: "#9AC3E1"
      Learnability/ Lifelong Learning Score on Spark: "#FFA355"
      Domain Skills/ Tools: "#90D16C"
      Presentation & Communication Skills: "#ED857B"
      LXP: "#429338"
      MyGuide: "#EA4C29"
      Sense of Urgency/ Efficiency: "#5EA7CF"
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 18
    col: 0
    width: 13
    height: 8
  - name: AVG Skills Added By Users
    title: AVG Skills Added By Users
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: single_value
    fields: [u1_users_skills_vw.count_of_user_id, u1_users_skills_vw.skill_id_count,
      u1_users_skills_vw.avg_skills_added_by_user]
    filters:
      u1_users_skills_vw.skill_type: Skills
      u1_users_skills_vw.user_account_status: "-EMPTY"
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_skill_id, based_on: u1_users_skills_vw.skill_id,
        expression: '', label: Count of Skill ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: JkQADH1B74}, {measure: count_of_user_id, based_on: u1_users_skills_vw.user_id,
        expression: '', label: Count of User ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: nX19n2RPpY}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: AVG Skills Added By Users
    value_format: "##"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [u1_users_skills_vw.count_of_user_id, u1_users_skills_vw.skill_id_count]
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 0
    col: 19
    width: 5
    height: 3
  - name: Top 10 Skills Added by Users
    title: Top 10 Skills Added by Users
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: looker_bar
    fields: [u1_users_skills_vw.skill_name, u1_users_skills_vw.beginner, u1_users_skills_vw.intermediate,
      u1_users_skills_vw.advanced, u1_users_skills_vw.undeclared, u1_users_skills_vw.total_levels]
    filters:
      u1_users_skills_vw.excluded_from_leaderboard: ''
      u1_users_skills_vw.user_account_status: ''
      u1_users_skills_vw.skill_type: Skills
    sorts: [u1_users_skills_vw.total_levels desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row( ${u1_users_skills_vw.count}))',
        label: Total, value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number, id: lKOjUxHxgp, is_disabled: true}]
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
    stacking: normal
    limit_displayed_rows: true
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: u1_users_skills_vw.beginner,
            id: u1_users_skills_vw.beginner, name: Beginner}, {axisId: u1_users_skills_vw.intermediate,
            id: u1_users_skills_vw.intermediate, name: Intermediate}, {axisId: u1_users_skills_vw.advanced,
            id: u1_users_skills_vw.advanced, name: Advanced}, {axisId: u1_users_skills_vw.undeclared,
            id: u1_users_skills_vw.undeclared, name: Undeclared}], showLabels: false,
        showValues: true, valueFormat: '[>999999]#.0,,\M;[>999] 0.0,"K";0', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    font_size: 10px
    series_types: {}
    series_colors:
      Advanced - u1_users_skills_vw.count: "#429338"
      Beginner - u1_users_skills_vw.count: "#AC86C1"
      Intermediate - u1_users_skills_vw.count: "#5EA7CF"
      Undeclared - u1_users_skills_vw.count: "#FF746E"
      u1_users_skills_vw.beginner: "#AC86C1"
      u1_users_skills_vw.intermediate: "#5EA7CF"
      u1_users_skills_vw.advanced: "#429338"
      u1_users_skills_vw.undeclared: "#FF746E"
    label_color: [grey]
    defaults_version: 1
    hidden_fields: [derived_table_Top_10_Skills_Added_by_Users.rank, u1_users_skills_vw.total_levels]
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 3
    col: 13
    width: 11
    height: 7
  - name: Monthly Skills Added
    title: Monthly Skills Added
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: looker_line
    fields: [u1_users_skills_vw.created_month, u1_users_skills_vw.count, u1_users_skills_vw.skill_level]
    pivots: [u1_users_skills_vw.skill_level]
    fill_fields: [u1_users_skills_vw.created_month]
    filters:
      u1_users_skills_vw.skill_type: Skills
      u1_users_skills_vw.excluded_from_leaderboard: ''
      u1_users_skills_vw.user_account_status: ''
    sorts: [u1_users_skills_vw.skill_level, u1_users_skills_vw.created_month desc]
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
    legend_position: right
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: Skills Added By Users, orientation: left, series: [{axisId: u1_users_skills_vw.count,
            id: Advanced - u1_users_skills_vw.count, name: Advanced}, {axisId: u1_users_skills_vw.count,
            id: Beginner - u1_users_skills_vw.count, name: Beginner}, {axisId: u1_users_skills_vw.count,
            id: Intermediate - u1_users_skills_vw.count, name: Intermediate}, {axisId: u1_users_skills_vw.count,
            id: Undeclared - u1_users_skills_vw.count, name: Undeclared}, {axisId: u1_users_skills_vw.count,
            id: unknown - u1_users_skills_vw.count, name: unknown}], showLabels: false,
        showValues: true, valueFormat: '[>999999]#.0,,\M;[>999] 0.0,"K";0', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_types: {}
    series_colors:
      Advanced - u1_users_skills_vw.count: "#429338"
      Beginner - u1_users_skills_vw.count: "#AC86C1"
      Intermediate - u1_users_skills_vw.count: "#5EA7CF"
      Undeclared - u1_users_skills_vw.count: "#FF746E"
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    defaults_version: 1
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 10
    col: 0
    width: 13
    height: 8
  - title: Top Skills by Beginner Level
    name: Top Skills by Beginner Level
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: looker_pie
    fields: [u1_users_skills_vw.skill_name, u1_users_skills_vw.count]
    filters:
      u1_users_skills_vw.skill_level: Beginner
      u1_users_skills_vw.user_account_status: ''
      u1_users_skills_vw.excluded_from_leaderboard: ''
    sorts: [u1_users_skills_vw.count desc 0]
    limit: 5
    column_limit: 50
    value_labels: labels
    label_type: labVal
    series_colors:
      Artificial Intelligence Basics: "#429338"
      Machine Learning: "#429338"
      Basic Analytics and Data Insights: "#FFA355"
      Computer Vision: "#90D16C"
      Big Data & Data Engineering: "#FFA355"
      Project Mgmt, Execution Skills/W3 Orientation: "#EA4C29"
      Learnability/ Lifelong Learning Score on Spark: "#5EA7CF"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 18
    col: 13
    width: 11
    height: 8
  - title: "#skills"
    name: "#skills"
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: single_value
    fields: [u1_users_skills_vw.skill_id_count]
    filters:
      u1_users_skills_vw.skill_type: Skills
      u1_users_skills_vw.user_account_status: "-EMPTY"
      u1_users_skills_vw.excluded_from_leaderboard: ''
    limit: 500
    dynamic_fields: [{measure: count_of_skill_id, based_on: u1_users_skills_vw.skill_id,
        expression: '', label: Count of Skill ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: jAXOV22BWn}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 0
    col: 13
    width: 6
    height: 3
  - title: Skills Added By users [Data Explorer]
    name: Skills Added By users [Data Explorer]
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: looker_grid
    fields: [u1_users_skills_vw.skill_name, u1_users_skills_vw.skill_id_count, u1_users_skills_vw.skill_level]
    filters:
      u1_users_skills_vw.skill_type: Skills
      u1_users_skills_vw.user_account_status: "-EMPTY"
      u1_users_skills_vw.excluded_from_leaderboard: ''
    sorts: [u1_users_skills_vw.skill_id_count desc 0]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      u1_users_skills_vw.skill_id_count:
        is_active: true
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 26
    col: 13
    width: 11
    height: 10
  - title: Most Popular Skills Added by Users
    name: Most Popular Skills Added by Users
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    type: looker_wordcloud
    fields: [u1_users_skills_vw.skill_name, u1_users_skills_vw.skill_id_count]
    filters:
      u1_users_skills_vw.skill_type: Skills
      u1_users_skills_vw.user_account_status: ''
      u1_users_skills_vw.excluded_from_leaderboard: ''
    sorts: [u1_users_skills_vw.skill_id_count desc 0]
    limit: 50
    column_limit: 50
    color_application: undefined
    rotation: false
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen:
      Choose Date Range: u1_users_skills_vw.created_date
      Skill Name - Filter: u1_users_skills_vw.skill_name
    row: 26
    col: 0
    width: 13
    height: 10
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
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    listens_to_filters: []
    field: u1_users_skills_vw.created_date
  - name: Skill Name - Filter
    title: Skill Name - Filter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_concord_dawn_qa
    explore: u1_users_skills_vw
    listens_to_filters: []
    field: u1_users_skills_vw.skill_name
