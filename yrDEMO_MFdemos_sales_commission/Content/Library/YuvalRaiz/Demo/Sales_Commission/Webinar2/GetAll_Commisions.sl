namespace: YuvalRaiz.Demo.Sales_Commission.Webinar2
flow:
  name: GetAll_Commisions
  inputs:
    - go_second
  workflow:
    - is_true:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: "${str(go_second.lower() == 'true')}"
        navigate:
          - 'TRUE': sql_query
          - 'FALSE': sql_query_all_rows
    - sql_query_all_rows:
        do:
          io.cloudslang.base.database.sql_query_all_rows:
            - db_server_name: "${get_sp('mfdemos.sales_commission.dbserver')}"
            - db_type: PostgreSQL
            - username: "${get_sp('mfdemos.sales_commission.dbuser')}"
            - password:
                value: "${get_sp('mfdemos.sales_commission.dbpassword')}"
                sensitive: true
            - db_port: '5432'
            - database_name: "${get_sp('mfdemos.sales_commission.dbtable')}"
            - command: "${'''select distinct account_manager from  %s ''' % (get_sp('mfdemos.sales_commission.dbname'))}"
            - trust_all_roots: 'true'
            - row_delimiter: ;
            - account_manager: '${account_manager}'
        publish:
          - am_list: '${return_result}'
        navigate:
          - SUCCESS: GetAMCommisionTotal
          - FAILURE: on_failure
    - GetAMCommisionTotal:
        loop:
          for: "am in am_list.split(';')"
          do:
            YuvalRaiz.Demo.Sales_Commission.Webinar2.GetAMCommisionTotal:
              - account_manager: '${am}'
          break:
            - FAILURE
          publish:
            - msg
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
    - sql_query:
        do:
          io.cloudslang.base.database.sql_query:
            - db_server_name: "${get_sp('mfdemos.sales_commission.dbserver')}"
            - db_type: PostgreSQL
            - username: "${get_sp('mfdemos.sales_commission.dbuser')}"
            - password:
                value: "${get_sp('mfdemos.sales_commission.dbpassword')}"
                sensitive: true
            - db_port: '5432'
            - database_name: "${get_sp('mfdemos.sales_commission.dbtable')}"
            - db_url: "${'''jdbc:postgresql://%s:5432/%s''' % (get_sp('mfdemos.sales_commission.dbserver'),get_sp('mfdemos.sales_commission.dbname'))}"
            - command: "${'''select distinct account_manager from  %s ''' % (get_sp('mfdemos.sales_commission.dbname'))}"
            - trust_all_roots: 'true'
            - key: account_manager
        publish:
          - account_manager: '${return_result}'
        navigate:
          - HAS_MORE: GetAMCommisionTotal_1
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - GetAMCommisionTotal_1:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar2.GetAMCommisionTotal:
            - account_manager: '${account_manager}'
        publish:
          - msg
        navigate:
          - FAILURE: on_failure
          - SUCCESS: sql_query
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      sql_query_all_rows:
        x: 194
        'y': 111
      GetAMCommisionTotal:
        x: 403
        'y': 116
        navigate:
          cc4f9309-ffc5-957f-051d-9abbcf1c4d44:
            targetId: 7b939900-c64f-4bd8-2df7-9f4b4c104c49
            port: SUCCESS
      is_true:
        x: 66
        'y': 278
      sql_query:
        x: 195
        'y': 384
        navigate:
          a08ba10c-09a7-e01f-22a3-1d33598d5e30:
            targetId: 7b939900-c64f-4bd8-2df7-9f4b4c104c49
            port: NO_MORE
      GetAMCommisionTotal_1:
        x: 417
        'y': 373
    results:
      SUCCESS:
        7b939900-c64f-4bd8-2df7-9f4b4c104c49:
          x: 594
          'y': 87
