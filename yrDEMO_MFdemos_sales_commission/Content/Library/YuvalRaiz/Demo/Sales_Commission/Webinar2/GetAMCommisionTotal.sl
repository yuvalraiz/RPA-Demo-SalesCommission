namespace: YuvalRaiz.Demo.Sales_Commission.Webinar2
flow:
  name: GetAMCommisionTotal
  inputs:
    - account_manager
  workflow:
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
            - command: "${'''select sum(commission)  from  %s where account_manager = '%s' ''' % (get_sp('mfdemos.sales_commission.dbname'), account_manager)}"
            - trust_all_roots: 'true'
            - account_manager: '${account_manager}'
        publish:
          - total_commisson: '${cs_extract_number(return_result)}'
          - msg: "${account_manager+': '+total_commisson}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - total_commission: '${total_commisson}'
    - msg: '${msg}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      sql_query_all_rows:
        x: 137
        'y': 75
        navigate:
          ae28ebab-ae44-6da0-01c8-6916b8d500d6:
            targetId: 7b939900-c64f-4bd8-2df7-9f4b4c104c49
            port: SUCCESS
    results:
      SUCCESS:
        7b939900-c64f-4bd8-2df7-9f4b4c104c49:
          x: 368
          'y': 70
