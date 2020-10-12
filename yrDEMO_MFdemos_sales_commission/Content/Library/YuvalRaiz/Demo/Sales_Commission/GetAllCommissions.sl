namespace: YuvalRaiz.Demo.Sales_Commission
flow:
  name: GetAllCommissions
  workflow:
    - Init_Variables:
        do:
          io.cloudslang.base.utils.do_nothing: []
        publish:
          - Message: |
              'This is the list'
        navigate:
          - SUCCESS: Go_Over_All_AM
          - FAILURE: on_failure
    - Go_Over_All_AM:
        do:
          io.cloudslang.base.database.sql_query:
            - db_server_name: "${get_sp('mfdemos.sales_commission.dbserver')}"
            - db_type: PostgreSQL
            - username: "${get_sp('mfdemos.sales_commission.dbuser')}"
            - password:
                value: MFdemo.12345
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
          - HAS_MORE: GetTotalCommissionForAM
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - GetTotalCommissionForAM:
        do:
          YuvalRaiz.Demo.Sales_Commission.GetTotalCommissionForAM:
            - account_manager: '${account_manager}'
        publish:
          - msg
        navigate:
          - FAILURE: Go_Over_All_AM
          - SUCCESS: append_message
    - append_message:
        do:
          io.cloudslang.base.utils.do_nothing:
            - line_msg: '${msg}'
            - Message: '${Message}'
        publish:
          - Message: "${cs_append(Message,'\\n'+line_msg)}"
        navigate:
          - SUCCESS: Go_Over_All_AM
          - FAILURE: on_failure
  outputs:
    - Message: '${Message}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Init_Variables:
        x: 36
        'y': 130
      Go_Over_All_AM:
        x: 181
        'y': 126
        navigate:
          eeb80ccd-ced7-ab29-ec30-090f76a58708:
            targetId: 5abb84a0-da2a-d8da-8845-19bf32257a67
            port: NO_MORE
      GetTotalCommissionForAM:
        x: 367
        'y': 337
      append_message:
        x: 729
        'y': 358
    results:
      SUCCESS:
        5abb84a0-da2a-d8da-8845-19bf32257a67:
          x: 593
          'y': 44
