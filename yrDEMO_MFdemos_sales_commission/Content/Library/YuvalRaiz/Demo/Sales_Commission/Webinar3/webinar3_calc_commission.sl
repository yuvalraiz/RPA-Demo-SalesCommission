namespace: YuvalRaiz.Demo.Sales_Commission.Webinar3
operation:
  name: webinar3_calc_commission
  inputs:
  - commission_rate: '20'
  - deal_size: '2480'
  sequential_action:
    gav: com.microfocus.seq:YuvalRaiz.Demo.Sales_Commission.Webinar3.webinar3_calc_commission:1.0.0
    skills:
    - Java
    - SAP NWBC Desktop
    - SAP
    - SAPUI5
    - SAPWDJ
    - SAPWebExt
    - Terminal Emulators
    - Web
    - WPF
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
        active: true
      terminal_settings:
        active: false
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
    - step:
        id: '1'
        object_path: SystemUtil
        action: Run
        args: '"c:\windows\system32\calc.exe"'
    - step:
        id: '2'
        object_path: Window("Calculator").Static("calc_screen")
        action: Type
        args: Parameter("commission_rate")
    - step:
        id: '3'
        object_path: Window("Calculator").WinButton("Button_Div")
        action: Click
    - step:
        id: '4'
        object_path: Window("Calculator").Static("calc_screen")
        action: Type
        args: '"100"'
    - step:
        id: '5'
        object_path: Window("Calculator").WinButton("Button_multiple")
        action: Click
    - step:
        id: '6'
        object_path: Window("Calculator").Static("calc_screen")
        action: Type
        args: Parameter("deal_size")
    - step:
        id: '7'
        object_path: Window("Calculator").WinButton("Button_equal")
        action: Click
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '3605224'
    - step:
        id: '8'
        object_path: Window("Calculator").Static("calc_screen")
        action: Click
    - step:
        id: '9'
        object_path: Window("Calculator").Static("calc_screen")
        action: Output
        args: CheckPoint("return_number")
    - step:
        id: '10'
        object_path: Window("Calculator")
        action: Close
  outputs:
  - return_number:
      robot: true
      value: ${return_number}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Window
      name: Calculator
      properties:
      - property:
          value:
            value: Calculator
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: CalcFrame
            regular_expression: false
          name: regexpwndclass
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is owned window
          hidden: false
          read_only: false
          type: BOOL
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is child window
          hidden: false
          read_only: false
          type: BOOL
      basic_identification:
        property_ref:
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: CalcFrame
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Monday, October 12, 2020 12:10:01 PM
      child_objects:
      - object:
          class: WinButton
          name: Button_multiple
          properties:
          - property:
              value:
                value: '92'
                regular_expression: false
              name: window id
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Button
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - window id
            - text
            - nativeclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: Button
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, October 12, 2020 12:10:01 PM
          child_objects: []
      - object:
          class: WinButton
          name: Button_equal
          properties:
          - property:
              value:
                value: '121'
                regular_expression: false
              name: window id
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Button
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - window id
            - text
            - nativeclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: Button
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, October 12, 2020 12:10:01 PM
          child_objects: []
      - object:
          class: WinButton
          name: Button_Div
          properties:
          - property:
              value:
                value: '91'
                regular_expression: false
              name: window id
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Button
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - window id
            - text
            - nativeclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: Button
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, October 12, 2020 12:10:01 PM
          child_objects: []
      - object:
          class: Static
          name: calc_screen
          properties:
          - property:
              value:
                value: '150'
                regular_expression: false
              name: window id
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: Static
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - window id
            - nativeclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: Static
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, October 12, 2020 12:10:01 PM
          child_objects: []
  check_points_and_outputs:
  - check_point_and_output:
      standard_properties:
        standard_property:
        - value:
            value: '76'
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: y
          flags: '2104'
          inner_type: '3'
          type: NUMBER
        - value:
            value: '37'
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: x
          flags: '2104'
          inner_type: '3'
          type: NUMBER
        - value:
            value: '167'
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: width
          flags: '2104'
          inner_type: '3'
          type: NUMBER
        - value: ''
          visual_relations: ''
          parameter:
            value: '"return_number"'
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
            type: Parameter
          name: text
          flags: '16696'
          inner_type: '8'
          type: STRING
        - value:
            value: ''
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: testobjname
          flags: '3'
          inner_type: '0'
          type: STRING
        - value:
            value: ''
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: testobjgentype
          flags: '3'
          inner_type: '0'
          type: STRING
        - value:
            value: Output Value
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: step_type
          flags: '88'
          inner_type: '8'
          type: STRING
        - value:
            value: ''
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: parent
          flags: '9'
          inner_type: '0'
          type: STRING
        - value:
            value: ''
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: objectid
          flags: '9'
          inner_type: '0'
          type: STRING
        - value:
            value: ''
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: micclass
          flags: '3'
          inner_type: '0'
          type: STRING
        - value:
            value: '28'
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: height
          flags: '2104'
          inner_type: '3'
          type: NUMBER
        - value:
            value: '0'
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: focused
          flags: '2104'
          inner_type: '11'
          type: BOOL
        - value:
            value: '-1'
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: enabled
          flags: '18488'
          inner_type: '11'
          type: BOOL
        - value:
            value: ''
            regular_expression: false
            ignore_space: false
            match_case: false
            not_exact_match: false
            formula: false
          visual_relations: ''
          parameter: ''
          name: class name
          flags: '3'
          inner_type: '0'
          type: STRING
      settings: ''
      name: return_number
      type: Output
      class: VerifyObj
  parameters:
  - parameter:
      default_value:
        value: Parameter("return_number")
        parameter: 'Yes'
      description: ''
      name: return_number
  - parameter:
      default_value:
        value: Parameter("return_number")
        parameter: 'Yes'
      description: ''
      name: return_number_0
