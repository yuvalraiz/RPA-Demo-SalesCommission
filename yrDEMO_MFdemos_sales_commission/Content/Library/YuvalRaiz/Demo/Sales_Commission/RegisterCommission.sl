########################################################################################################################
#!!
#! @description: This flow will register the deal commission to the sales person both in the DB and in the sales commission web page.
#!               Once it is finish, It will send a email to the sales person
#!!#
########################################################################################################################
namespace: YuvalRaiz.Demo.Sales_Commission
flow:
  name: RegisterCommission
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
          - SUCCESS: Register_Commission_WebPage
          - FAILURE: on_failure
    - Register_Commission_WebPage:
        do:
          YuvalRaiz.Demo.Sales_Commission.SubFlows.Register_Commission_WebPage:
            - account_manager: '${account_manager}'
            - deal_size: '${deal_size}'
            - deal_currency: '${deal_currency}'
            - commission: '${commission}'
        navigate:
          - SUCCESS: send_mail
          - WARNING: send_mail
          - FAILURE: on_failure
    - send_mail:
        do:
          io.cloudslang.base.mail.send_mail:
            - hostname: "${get_sp('mfdemos.sales_commission.mailserver')}"
            - port: '465'
            - from: "${get_sp('mfdemos.sales_commission.email_addr')}"
            - to: '${account_manager_email}'
            - subject: Sales Compensation
            - body: |-
                ${'''Dear %s
                <br>
                This email infrom you that your deal <b>%s %s</B> was registered in the system.
                <br>
                You will get <B>%s</B> as commission
                <br>
                <br>
                Best Regards,
                <br>
                Sales Operations team
                ''' % ( account_manager, deal_size, deal_currency, commission)}
            - html_email: null
            - username: "${get_sp('mfdemos.sales_commission.email_addr')}"
            - password:
                value: "${get_sp('mfdemos.sales_commission.email_password')}"
                sensitive: true
            - enable_TLS: 'true'
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
        x: 86
        'y': 108
      Register_Commission_WebPage:
        x: 255
        'y': 109
      send_mail:
        x: 461
        'y': 116
        navigate:
          0d9059b6-2091-ae35-4c96-27771c8dc3de:
            targetId: f7242ce4-cba6-ce73-e1a4-a9c0525112c9
            port: SUCCESS
    results:
      SUCCESS:
        f7242ce4-cba6-ce73-e1a4-a9c0525112c9:
          x: 628
          'y': 115
