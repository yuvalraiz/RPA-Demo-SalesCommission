########################################################################################################################
#!!
#! @description: This flow will register the deal commission to the sales person both in the DB and in the sales commission web page.
#!               Once it is finish, It will send a email to the sales person
#!!#
########################################################################################################################
namespace: YuvalRaiz.Demo.Sales_Commission.SubFlows
flow:
  name: Pay
  inputs:
    - account_manager
    - account_manager_email
    - deal_size
    - deal_currency
    - commission
  workflow:
    - update_db:
        do:
          io.cloudslang.base.database.sql_command:
            - db_server_name: "${get_sp('mfdemos.sales_commission.dbserver')}"
            - db_type: PostgreSQL
            - username: "${get_sp('mfdemos.sales_commission.dbuser')}"
            - password:
                value: "${get_sp('mfdemos.sales_commission.dbpassword')}"
                sensitive: true
            - instance: null
            - db_port: '5432'
            - database_name: "${get_sp('mfdemos.sales_commission.dbtable')}"
            - db_url: "${'''jdbc:postgresql://%s:5432/%s''' % (get_sp('mfdemos.sales_commission.dbserver'),get_sp('mfdemos.sales_commission.dbname'))}"
            - command: |-
                ${'''insert into %s (account_manager, deal_size, deal_currency, commission)
                values ('%s', %s, '%s', %s)''' % (get_sp('mfdemos.sales_commission.dbname'), account_manager, deal_size, deal_currency.upper(), commission)}
            - trust_all_roots: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      update_db:
        x: 121
        'y': 128
        navigate:
          3a5721dd-2bc0-a754-e2bf-e02df793e63b:
            targetId: f7242ce4-cba6-ce73-e1a4-a9c0525112c9
            port: SUCCESS
    results:
      SUCCESS:
        f7242ce4-cba6-ce73-e1a4-a9c0525112c9:
          x: 372
          'y': 92
