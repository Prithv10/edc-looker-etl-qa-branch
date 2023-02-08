- dashboard: 7_1_user_adoption_and_clc
  title: 7.1 User Adoption and CLC
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: pBJN0fJFALRmHdkZ3S3YIL
  elements:
  - name: Active Users [Last 30 Days]
    title: Active Users [Last 30 Days]
    model: concord
    explore: u2_users_performance_part5_final_results_vw
    type: single_value
    fields: [u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
      u2_users_performance_part5_final_results_vw.time_month]
    fill_fields: [u2_users_performance_part5_final_results_vw.time_month]
    filters:
      u2_users_performance_part5_final_results_vw.performance_metric: "-Followers\
        \ (Users),-Total Completions"
      u2_users_performance_part5_final_results_vw.platform: "-EDC-LMS"
    sorts: [u2_users_performance_part5_final_results_vw.time_month desc]
    limit: 500
    dynamic_fields: [{measure: count_of_user_id, based_on: u2_users_performance_part5_final_results_vw.user_id,
        expression: '', label: Count of User ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: 6Z2aDkxKbG}, {args: [u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
        label: Percent change from previous - User Performance Count of Distinct User
          Ids, source_field: u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
        table_calculation: percent_change_from_previous_user_performance_count_of_distinct_user_ids,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: IrtHZ2Aefv, is_disabled: true}, {args: [u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
        label: Percent change from previous - User Performance Count of Distinct User
          Ids, source_field: u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
        table_calculation: percent_change_from_previous_user_performance_count_of_distinct_user_ids_2,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 2L8D6COccM}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Active Users [Last 30 Days]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 30
    col: 16
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","align":"start","children":[{"text":"About this Dashboard"}],"id":1663778356200},{"type":"p","children":[{"text":""}],"id":1663778359960},{"type":"p","children":[{"text":"Purpose:","fontSize":"18px","color":"rgb(86,
      231, 206)","bold":true,"backgroundColor":"rgb(255, 255, 255)"},{"text":" ","fontSize":"18px","color":"rgb(86,
      231, 206)","backgroundColor":"rgb(255, 255, 255)"},{"text":"This page shows
      some of the metrics around user activities and Continuous Learning Hours (CLHs)
      on the EdCast LXP. The data on this dashboard is for all users who have their
      accounts created on our LXP instance. All figures on the dashboard update every
      24 hours. ","fontSize":"14px","color":"rgb(84, 88, 90)","backgroundColor":"rgb(255,
      255, 255)"}],"id":1663778372289},{"type":"p","id":1663778384807,"children":[{"text":"How
      to Use: ","fontSize":"18px","color":"rgb(86, 231, 206)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"To
      explore the tile further, click on the ","fontSize":"14px","color":"rgb(84,
      88, 90)"},{"fontSize":"14px","color":"rgb(84, 88, 90)","text":"kebab","bold":true},{"fontSize":"14px","color":"rgb(84,
      88, 90)","text":" (three vertical dots) on the top right corner of the tile
      and then click "},{"fontSize":"14px","color":"rgb(84, 88, 90)","text":"Explore
      From Here","bold":true},{"fontSize":"14px","color":"rgb(84, 88, 90)","text":".
      "}],"id":1663778372294}],"id":1663778372290},{"type":"li","children":[{"type":"lic","children":[{"text":"To
      download the detailed data behind each chart,  click on the ","fontSize":"14px","color":"rgb(84,
      88, 90)"},{"fontSize":"14px","color":"rgb(84, 88, 90)","text":"kebab","bold":true},{"fontSize":"14px","color":"rgb(84,
      88, 90)","text":" (three vertical dots) on the top right corner of the tile
      and then click "},{"fontSize":"14px","color":"rgb(84, 88, 90)","text":"Download
      Data","bold":true},{"fontSize":"14px","color":"rgb(84, 88, 90)","text":"."}],"id":1663778372291}],"id":1663778372290}],"id":1663778372290},{"type":"p","children":[{"text":"\n"}],"id":1663778372290}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","align":"start","children":[{"text":"CLC Reports"}],"id":1663778406356},{"type":"p","children":[{"text":""}],"id":1663778407815},{"type":"p","id":1663778408224,"children":[{"text":"Number
      of CLC Hours by Number of Users by Month [last 6 months]","fontSize":"18px","color":"rgb(86,
      231, 206)","bold":true,"backgroundColor":"rgb(255, 255, 255)"},{"text":"﻿","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778424197,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":""}]},{"type":"p","id":1663778424800,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":"This graph shows the
      total CLHs on the portal by the number of users in the last 6 months. It''s
      a rolling graph for the previous 6 months (180 days).  ﻿"}]},{"type":"p","id":1663778702365,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":""}]},{"type":"p","id":1663778681530,"children":[{"text":"Green
      Line:","fontSize":"14px","color":"rgb(84, 88, 90)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"},{"text":" represents the number of learning hours. ﻿","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778703759,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":""}]},{"type":"p","id":1663778684768,"children":[{"text":"Grey
      Line: ","fontSize":"14px","color":"rgb(84, 88, 90)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"},{"text":"represents the number of users who contributed to those
      learning hours.","fontSize":"14px","color":"rgb(84, 88, 90)","backgroundColor":"rgb(255,
      255, 255)"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 5
    col: 0
    width: 6
    height: 8
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Monthly CLC Hours","fontSize":"18px","color":"rgb(86,
      231, 206)","bold":true,"backgroundColor":"rgb(255, 255, 255)"}]},{"type":"h1","id":1663778464458,"children":[{"text":"﻿","fontSize":"14px","color":"rgb(86,
      231, 206)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778447964,"children":[{"text":"This
      graph shows the monthly aggregated number of CLHs for all  users on platform
      for the current active period (i.e. year, quarter).","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778904727,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":"﻿We can filter for any
      user to see their month wise trend using the "},{"text":"User Full Name","fontSize":"14px","color":"rgb(84,
      88, 90)","bold":true,"backgroundColor":"rgb(255, 255, 255)"},{"text":" quick
      filter.﻿","fontSize":"14px","color":"rgb(84, 88, 90)","backgroundColor":"rgb(255,
      255, 255)"}]},{"type":"p","id":1663778907642,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":""}]},{"type":"p","id":1663778908658,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":"Disclaimer:","bold":true},{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":" data in this report
      may differ from LXP data due to calculation differences. Here we''re using the
      formula duration(sec)/3600 to convert into hours."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 23
    col: 0
    width: 6
    height: 7
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","align":"start","children":[{"text":"Adoption Metrics"}],"id":1663778490026},{"type":"p","children":[{"text":""}],"id":1663778491116},{"type":"p","children":[{"text":"Total
      Active Users﻿","fontSize":"18px","color":"rgb(86, 231, 206)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"}],"id":1663778508247},{"type":"p","id":1663778519072,"children":[{"text":"This
      report represents total active users for the current month and total users on
      the platform.﻿","fontSize":"14px","color":"rgb(84, 88, 90)","backgroundColor":"rgb(255,
      255, 255)"}]},{"type":"p","id":1663778522338,"children":[{"text":"","fontSize":"18px","color":"rgb(86,
      231, 206)","bold":true,"backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778522827,"children":[{"fontSize":"18px","color":"rgb(86,
      231, 206)","bold":true,"backgroundColor":"rgb(255, 255, 255)","text":"Active
      Users"},{"text":"﻿","fontSize":"18px","color":"rgb(84, 88, 90)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"}]},{"type":"p","id":1663778524712,"children":[{"text":"","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778524926,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":"This report displays
      active users for the last 30 days. The change value is the percentage of active
      users from the previous 30 day period to the current 30 day period. "}]},{"type":"p","id":1663778528884,"children":[{"text":"","fontSize":"14px","color":"rgb(84,
      88, 90)","bold":true,"backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778529261,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","bold":true,"backgroundColor":"rgb(255, 255, 255)","text":"﻿﻿"},{"text":"Monthly
      Adoption Metrics","fontSize":"18px","color":"rgb(86, 231, 206)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"},{"text":"﻿","fontSize":"18px","color":"rgb(84, 88, 90)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"}]},{"type":"p","id":1663778531643,"children":[{"text":"","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778531908,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":"This visualization shows
      the trailing 6-month trend of: "}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Registered
      Users","fontSize":"14px","color":"rgb(84, 88, 90)","bold":true}],"id":1663778508254}],"id":1663778508248},{"type":"li","children":[{"type":"lic","children":[{"text":"Active
      Users ","fontSize":"14px","color":"rgb(84, 88, 90)","bold":true}],"id":1663778508253}],"id":1663778508248},{"type":"li","children":[{"type":"lic","children":[{"text":"Active
      Users (New)","fontSize":"14px","color":"rgb(84, 88, 90)","bold":true}],"id":1663778508250}],"id":1663778508248}],"id":1663778508248},{"type":"p","children":[{"text":"﻿","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"},{"text":"Registered Users:","fontSize":"14px","color":"rgb(84,
      88, 90)","bold":true,"backgroundColor":"rgb(255, 255, 255)"},{"text":"  All
      users on the platform,  including those with statuses of  ''suspended'' or ''deleted''.﻿","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"},{"text":"Monthly Active Users
      (MAUs):","fontSize":"14px","color":"rgb(84, 88, 90)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"},{"text":" Users who logged into the platform and performed any one
      of the following activities: Card View, Card Like, Card Completed, Card Bookmarked,
      Card Shared, Comment.﻿","fontSize":"14px","color":"rgb(84, 88, 90)","backgroundColor":"rgb(255,
      255, 255)"},{"text":"Monthly Active Users (New):","fontSize":"14px","color":"rgb(84,
      88, 90)","bold":true,"backgroundColor":"rgb(255, 255, 255)"},{"text":" Users
      who logged into the platform & performed an activity for the first time.","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"}],"id":1663778508248}]'
    rich_content_json: '{"format":"slate"}'
    row: 30
    col: 0
    width: 6
    height: 16
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Top 20 Users By CLC Hours","fontSize":"18px","color":"rgb(86,
      231, 206)","bold":true,"backgroundColor":"rgb(255, 255, 255)"}]},{"type":"h1","id":1663778788091,"children":[{"text":"﻿","fontSize":"14px","color":"rgb(86,
      231, 206)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663778775454,"children":[{"text":"This
      graph shows the Top 20 Users based on total CLHs on the portal for the current
      active period (i.e. this year, quarter)﻿.","fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)"}]},{"type":"p","id":1663779005885,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":"This report enables
      a drill-down of a specific user''s CLHs over time. To do so, click on "},{"text":"User
      Full Name.","fontSize":"14px","color":"rgb(84, 88, 90)","bold":true,"backgroundColor":"rgb(255,
      255, 255)"},{"text":"﻿","fontSize":"14px","color":"rgb(84, 88, 90)","backgroundColor":"rgb(255,
      255, 255)"}]},{"type":"p","id":1663779009289,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":""}]},{"type":"p","id":1663779010001,"children":[{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":"Disclaimer:","bold":true},{"fontSize":"14px","color":"rgb(84,
      88, 90)","backgroundColor":"rgb(255, 255, 255)","text":" data in this report
      may differ from LXP data due to calculation differences. Here we''re using the
      formula duration(sec)/3600 to convert into hours."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 0
    width: 6
    height: 10
  - title: Top 20 Edcast Users By their CLC HRS
    name: Top 20 Edcast Users By their CLC HRS
    model: concord
    explore: clc_2_0_vw
    type: looker_bar
    fields: [clc_2_0_vw.user_full_name, clc_2_0_vw.duration_in_hours]
    filters:
      clc_2_0_vw.from_date: 2021/01/01 to 2022/01/02
      clc_2_0_vw.user_account_status: active
      clc_2_0_vw.clcstatus: ''
    sorts: [clc_2_0_vw.duration_in_hours desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${clc_2_0_vw.duration_in_hours}",
        label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: new_calculation, _type_hint: number,
        id: 3PSUNO1s2U, is_disabled: true}, {category: table_calculation, expression: "${clc_2_0_vw.total_duration}/60/60",
        label: Total Duration in Hrs, value_format: !!null '', value_format_name: decimal_2,
        _kind_hint: measure, table_calculation: total_duration_in_hrs, _type_hint: number,
        id: wlsTUzvsJZ, is_disabled: true}]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: clc_2_0_vw.duration_in_hours,
            id: clc_2_0_vw.duration_in_hours, name: Duration In Hours}], showLabels: true,
        showValues: true, valueFormat: '[>999999]#.0,,\M;[>999] 0.0,"K";0', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    font_size: 10px
    label_value_format: '#,##0.00" Hrs"'
    series_types: {}
    series_colors:
      clc_2_0_vw.duration_in_hours: "#70E0C9"
    label_color: [grey]
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 13
    col: 6
    width: 18
    height: 10
  - name: Total Active Users [Current Month]
    title: Total Active Users [Current Month]
    model: concord
    explore: u3_users_adoption_details_vw
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [u3_users_adoption_details_vw.total_registered_users, u3_users_adoption_details_vw.distinct_monthly_active_users]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 4
    target_gap: 5
    target_weight: 17
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: second
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#70E0C9"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.05
    bar_arm_length: 9
    bar_arm_weight: 48
    bar_spinner_length: 121
    bar_spinner_weight: 25
    bar_style: vertical
    bar_range_min: 0
    bar_range_max: 100.701
    bar_value_label_type: both
    bar_value_label_font: 8
    bar_value_label_padding: 45
    bar_target_source: 'off'
    bar_target_label_type: none
    bar_target_label_font: 3
    bar_target_label_override: ''
    bar_target_value_override: ''
    bar_label_font_size: 3
    bar_fill_color: "#5de6d2"
    bar_background_color: "#cea2c3"
    bar_spinner_color: "#F3BEB9"
    bar_range_color: "#282828"
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
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
    defaults_version: 0
    listen: {}
    row: 30
    col: 6
    width: 10
    height: 6
  - title: "# CLC Hours By # Users - Month Wise[Last 6 Months]"
    name: "# CLC Hours By # Users - Month Wise[Last 6 Months]"
    model: concord
    explore: clc_2_0_vw
    type: looker_line
    fields: [clc_2_0_vw.completed_month, clc_2_0_vw.count_distinct_uid, clc_2_0_vw.duration_in_hours]
    fill_fields: [clc_2_0_vw.completed_month]
    filters:
      clc_2_0_vw.completed_month: 6 months
    sorts: [clc_2_0_vw.completed_month desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${clc_2_0_vw.total_duration}/3600",
        label: Duration in Hours, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: duration_in_hours, _type_hint: number,
        id: 6luznQN9gm, is_disabled: true}, {measure: count_of_user_id, based_on: clc_2_0_vw.user_id,
        expression: '', label: Count of User ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: 7LZTmL7iRZ}]
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: clc_2_0_vw.count_distinct_uid,
            id: clc_2_0_vw.count_distinct_uid, name: Count Distinct Uid}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear},
      {label: '', orientation: right, series: [{axisId: clc_2_0_vw.duration_in_hours,
            id: clc_2_0_vw.duration_in_hours, name: Duration In Hours}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    font_size: 10px
    series_colors:
      count_of_user_id: "#989898"
      duration_in_hours: "#27E3C7"
      clc_2_0_vw.count_distinct_uid: "#989898"
      clc_2_0_vw.duration_in_hours: "#27E3C7"
    series_labels:
      count_of_user_id: No. of Users
      duration_in_hours: Learning Hrs
      clc_2_0_vw.count_distinct_uid: No. of Users
      clc_2_0_vw.duration_in_hours: Learning Hours
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 5
    col: 6
    width: 18
    height: 8
  - title: Monthly Adoption Metrics
    name: Monthly Adoption Metrics
    model: concord
    explore: u3_users_adoption_details_vw
    type: looker_line
    fields: [u3_users_adoption_details_vw.time_month, u3_users_adoption_details_vw.adoption_metric,
      u3_users_adoption_details_vw.count]
    pivots: [u3_users_adoption_details_vw.adoption_metric]
    fill_fields: [u3_users_adoption_details_vw.time_month]
    filters:
      u3_users_adoption_details_vw.time_month: 6 months
    sorts: [u3_users_adoption_details_vw.adoption_metric, u3_users_adoption_details_vw.time_month
        desc]
    limit: 500
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: u3_users_adoption_details_vw.count,
            id: Active Users (New) - u3_users_adoption_details_vw.count, name: Active
              Users (New)}, {axisId: u3_users_adoption_details_vw.count, id: Monthly
              Active Users - u3_users_adoption_details_vw.count, name: Monthly Active
              Users}, {axisId: u3_users_adoption_details_vw.count, id: Total Registered
              Users - u3_users_adoption_details_vw.count, name: Total Registered Users}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_types: {}
    series_colors:
      Total Registered Users - u3_users_adoption_details_vw.count: "#27E3C7"
      Active Users (New) - u3_users_adoption_details_vw.count: "#5EA7CF"
      Monthly Active Users - u3_users_adoption_details_vw.count: "#989898"
    series_point_styles:
      Active Users (New) - u3_users_adoption_details_vw.count: triangle
      Monthly Active Users - u3_users_adoption_details_vw.count: square
    label_color: [grey]
    x_axis_datetime_label: "%b-%Y"
    defaults_version: 1
    listen: {}
    row: 36
    col: 6
    width: 18
    height: 10
  - title: Month Wise CLC HRS
    name: Month Wise CLC HRS
    model: concord
    explore: clc_2_0_vw
    type: looker_column
    fields: [clc_2_0_vw.completed_month, clc_2_0_vw.duration_in_hours]
    fill_fields: [clc_2_0_vw.completed_month]
    filters:
      clc_2_0_vw.clcstatus: "-InActive"
      clc_2_0_vw.user_account_status: ''
      clc_2_0_vw.excluded_from_leaderboard: ''
      clc_2_0_vw.user_full_name: ''
    sorts: [clc_2_0_vw.completed_month desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_duration, based_on: clc_2_0_vw.duration, expression: '',
        label: Sum of Duration, type: sum, _kind_hint: measure, _type_hint: number,
        id: PKuDnD971h}, {measure: sum_of_duration_2, based_on: clc_2_0_vw.duration,
        expression: '', label: Sum of Duration, type: sum, _kind_hint: measure, _type_hint: number,
        id: 5jswtuxDWX}, {measure: sum_of_duration_3, based_on: clc_2_0_vw.duration,
        expression: '', label: Sum of Duration, type: sum, _kind_hint: measure, _type_hint: number,
        id: WerHRjPqbq}, {measure: count_of_completed_month, based_on: clc_2_0_vw.completed_month,
        expression: '', label: Count of Completed Month, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: B0JggNUkKU}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: clc_2_0_vw.duration_in_hours,
            id: clc_2_0_vw.duration_in_hours, name: Duration In Hours}], showLabels: false,
        showValues: true, valueFormat: '[>999999]#.0,,\M;[>999] 0.0,"K";0', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    label_value_format: ''
    series_types: {}
    series_colors:
      clc_2_0_vw.duration: "#81E4CE"
      clc_2_0_vw.duration_in_hours: "#27E3C7"
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 23
    col: 6
    width: 18
    height: 7
