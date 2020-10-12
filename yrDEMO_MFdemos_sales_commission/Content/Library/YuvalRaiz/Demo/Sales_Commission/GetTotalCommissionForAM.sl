########################################################################################################################
#!!
#! @description: This flow calc the am commission
#!
#! @input account_manager: The account manager
#!
#! @output am_commission: This is the commission value in $
#!!#
########################################################################################################################
namespace: YuvalRaiz.Demo.Sales_Commission
flow:
  name: GetTotalCommissionForAM
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
                value: MFdemo.12345
                sensitive: true
            - db_port: '5432'
            - database_name: "${get_sp('mfdemos.sales_commission.dbtable')}"
            - command: "${'''select sum(commission)  from  %s where account_manager = '%s' ''' % (get_sp('mfdemos.sales_commission.dbname'), account_manager)}"
            - trust_all_roots: 'true'
            - account_manager: '${account_manager}'
        publish:
          - total_commission: '${cs_extract_number(return_result,)}'
          - msg: "${'''%s: %s''' % (account_manager, total_commission)}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - am_commission: '${total_commission}'
    - msg: '${msg}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      sql_query_all_rows:
        x: 127
        'y': 136
        navigate:
          12f7d7c0-4d9c-7cc5-bddd-efd7e3d64f72:
            targetId: 145cf254-6900-07eb-d790-f0fd9bfccc29
            port: SUCCESS
    results:
      SUCCESS:
        145cf254-6900-07eb-d790-f0fd9bfccc29:
          x: 446
          'y': 130
