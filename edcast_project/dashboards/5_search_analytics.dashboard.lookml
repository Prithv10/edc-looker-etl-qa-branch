- dashboard: 5__search_analytics
  title: 5. Search Analytics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: S8FQ82CGHMvOT2B1UA0Wgu
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Search Attributes**##"
    row: 0
    col: 11
    width: 6
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Search Trends**##"
    row: 0
    col: 0
    width: 6
    height: 2
  - name: Top 20 Searches [Last 30 Days]
    title: Top 20 Searches [Last 30 Days]
    model: concord
    explore: se1_searches_search_user_details
    type: looker_bar
    fields: [se1_searches_search_user_details.search_query, se1_searches_search_user_details.web,
      se1_searches_search_user_details.ios, se1_searches_search_user_details.android,
      se1_searches_search_user_details.widgets, se1_searches_search_user_details.slack,
      se1_searches_search_user_details.sfdc, se1_searches_search_user_details.o365_word,
      se1_searches_search_user_details.o365_ppt, se1_searches_search_user_details.o365_excel,
      se1_searches_search_user_details.ms_teams, se1_searches_search_user_details.gsuite_slides,
      se1_searches_search_user_details.gsuite_sheets, se1_searches_search_user_details.gsuite_docs,
      se1_searches_search_user_details.total_platforms]
    filters:
      se1_searches_search_user_details.user_full_name: ''
      se1_searches_search_user_details.search_query: "-*,-NULL"
    sorts: [se1_searches_search_user_details.total_platforms desc]
    limit: 20
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
    stacking: normal
    limit_displayed_rows: true
    legend_position: center
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: se1_searches_search_user_details.web,
            id: se1_searches_search_user_details.web, name: Web}, {axisId: se1_searches_search_user_details.ios,
            id: se1_searches_search_user_details.ios, name: Ios}, {axisId: se1_searches_search_user_details.android,
            id: se1_searches_search_user_details.android, name: Android}, {axisId: se1_searches_search_user_details.widgets,
            id: se1_searches_search_user_details.widgets, name: Widgets}, {axisId: se1_searches_search_user_details.slack,
            id: se1_searches_search_user_details.slack, name: Slack}, {axisId: se1_searches_search_user_details.sfdc,
            id: se1_searches_search_user_details.sfdc, name: Sfdc}, {axisId: se1_searches_search_user_details.o365_word,
            id: se1_searches_search_user_details.o365_word, name: O365 Word}, {axisId: se1_searches_search_user_details.o365_ppt,
            id: se1_searches_search_user_details.o365_ppt, name: O365 Ppt}, {axisId: se1_searches_search_user_details.o365_excel,
            id: se1_searches_search_user_details.o365_excel, name: O365 Excel}, {
            axisId: se1_searches_search_user_details.ms_teams, id: se1_searches_search_user_details.ms_teams,
            name: Ms Teams}, {axisId: se1_searches_search_user_details.gsuite_slides,
            id: se1_searches_search_user_details.gsuite_slides, name: Gsuite Slides},
          {axisId: se1_searches_search_user_details.gsuite_sheets, id: se1_searches_search_user_details.gsuite_sheets,
            name: Gsuite Sheets}, {axisId: se1_searches_search_user_details.gsuite_docs,
            id: se1_searches_search_user_details.gsuite_docs, name: Gsuite Docs}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    font_size: 10px
    series_types: {}
    series_colors:
      android - se1_searches_search_user_details.count: "#ACD47D"
      GSuite - Docs - se1_searches_search_user_details.count: "#F0AF65"
      ios - se1_searches_search_user_details.count: "#9AC3E1"
      Microsoft Teams - se1_searches_search_user_details.count: "#ED9149"
      O365 - PPT - se1_searches_search_user_details.count: "#F5D08E"
      O365 - Word - se1_searches_search_user_details.count: "#8FBF69"
      SFDC - se1_searches_search_user_details.count: "#679B47"
      web - se1_searches_search_user_details.count: "#8970BB"
      GSuite - Slides - se1_searches_search_user_details.count: "#F5D08E"
      GSuite - Sheets - se1_searches_search_user_details.count: "#D45F34"
      se1_searches_search_user_details.web: "#8562B5"
      se1_searches_search_user_details.ios: "#7DBCDE"
      se1_searches_search_user_details.android: "#90D16C"
      se1_searches_search_user_details.widgets: "#3A81AF"
      se1_searches_search_user_details.slack: "#D6F2B5"
      se1_searches_search_user_details.sfdc: "#6DBA59"
      se1_searches_search_user_details.o365_word: "#AFE08B"
      se1_searches_search_user_details.o365_ppt: "#429338"
      se1_searches_search_user_details.o365_excel: "#FFE9A8"
      se1_searches_search_user_details.ms_teams: "#FF823A"
      se1_searches_search_user_details.gsuite_slides: "#FFC87F"
      se1_searches_search_user_details.gsuite_sheets: "#EA4C29"
      se1_searches_search_user_details.gsuite_docs: "#FFA355"
    label_color: [grey]
    defaults_version: 1
    hidden_fields: [derived_table_top_20_searches_search_analytics.rank, se1_searches_search_user_details.total_platforms]
    listen:
      " Date": se1_searches_search_user_details.time_date
      Platform: se1_searches_search_user_details.platform
      User Account Status: se1_searches_search_user_details.user_account_status
      Excluded From Leaderboard: se1_searches_search_user_details.excluded_from_leaderboard
    row: 2
    col: 0
    width: 12
    height: 10
  - name: Searches by Platform [Last 30 Days]
    title: Searches by Platform [Last 30 Days]
    model: concord
    explore: se1_searches_search_user_details
    type: looker_grid
    fields: [se1_searches_search_user_details.count, se1_searches_search_user_details.platform]
    filters: {}
    sorts: [se1_searches_search_user_details.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${se1_searches_search_user_details.count}))',
        label: Total Row Sum, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: total_row_sum, _type_hint: number,
        is_disabled: true, id: S7vMeiMfIU}, {args: [total_row_sum], calculation_type: rank_of_column,
        category: table_calculation, based_on: total_row_sum, label: Rank of  Total
          Row Sum, source_field: total_row_sum, table_calculation: rank_of_total_row_sum,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true, id: xzYKeyQz6t}]
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
      se1_searches_search_user_details.count:
        is_active: true
    value_labels: legend
    label_type: labPer
    inner_radius:
    start_angle:
    series_colors:
      web: "#8970BB"
      Microsoft Teams: "#5C8BB6"
      android: "#ACD47D"
      ios: "#9AC3E1"
      SFDC: "#679B47"
      O365 - PPT: "#F5D08E"
      GSuite - Docs: "#ED9149"
      O365 - Word: "#D45F34"
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: web - se1_searches_search_user_details.count,
            id: web - se1_searches_search_user_details.count, name: web}, {axisId: O365
              - Word - se1_searches_search_user_details.count, id: O365 - Word - se1_searches_search_user_details.count,
            name: O365 - Word}, {axisId: Microsoft Teams - se1_searches_search_user_details.count,
            id: Microsoft Teams - se1_searches_search_user_details.count, name: Microsoft
              Teams}, {axisId: ios - se1_searches_search_user_details.count, id: ios
              - se1_searches_search_user_details.count, name: ios}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      " Date": se1_searches_search_user_details.time_date
      Platform: se1_searches_search_user_details.platform
      User Account Status: se1_searches_search_user_details.user_account_status
      Excluded From Leaderboard: se1_searches_search_user_details.excluded_from_leaderboard
    row: 2
    col: 12
    width: 12
    height: 10
  filters:
  - name: " Date"
    title: " Date"
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: concord
    explore: se1_searches_search_user_details
    listens_to_filters: []
    field: se1_searches_search_user_details.time_date
  - name: Platform
    title: Platform
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: concord
    explore: se1_searches_search_user_details
    listens_to_filters: []
    field: se1_searches_search_user_details.platform
  - name: User Account Status
    title: User Account Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: concord
    explore: se1_searches_search_user_details
    listens_to_filters: []
    field: se1_searches_search_user_details.user_account_status
  - name: Excluded From Leaderboard
    title: Excluded From Leaderboard
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: se1_searches_search_user_details
    listens_to_filters: []
    field: se1_searches_search_user_details.excluded_from_leaderboard
