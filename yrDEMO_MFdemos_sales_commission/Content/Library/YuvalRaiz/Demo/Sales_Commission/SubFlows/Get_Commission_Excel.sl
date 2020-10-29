namespace: YuvalRaiz.Demo.Sales_Commission.SubFlows
flow:
  name: Get_Commission_Excel
  workflow:
    - get_newest_relevant_email:
        do:
          YuvalRaiz.yrUtil.get_newest_relevant_email:
            - mailserver: "${get_sp('mfdemos.sales_commission.mailserver')}"
            - username: "${get_sp('mfdemos.sales_commission.email_addr')}"
            - password:
                value: "${get_sp('mfdemos.sales_commission.email_password')}"
                sensitive: true
            - sender: yuval.raiz@gmail.com
            - subject: Sales Commissions
        publish:
          - msg_number
          - attached_file_names
        navigate:
          - FAILURE: on_failure
          - SUCCESS: get_mail_attachment
    - get_mail_attachment:
        do:
          io.cloudslang.base.mail.get_mail_attachment:
            - host: "${get_sp('mfdemos.sales_commission.mailserver')}"
            - protocol: imap4
            - username: "${get_sp('mfdemos.sales_commission.email_addr')}"
            - password:
                value: "${get_sp('mfdemos.sales_commission.email_password')}"
                sensitive: true
            - message_number: '${msg_number}'
            - destination: /SharedData/RPA_Data/DemoData
            - attachment_name: '${attached_file_names}'
            - overwrite: 'true'
            - trust_all_roots: 'true'
            - enable_TLS: 'true'
        publish:
          - excel_file_path: "${destination+'/'+attachment_name}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - excel_file_path
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_newest_relevant_email:
        x: 61
        'y': 118
      get_mail_attachment:
        x: 334
        'y': 119
        navigate:
          71e90981-5c56-2fda-1da5-fa704b976cea:
            targetId: 217df726-8818-ec29-9076-a8bcb5cb007a
            port: SUCCESS
    results:
      SUCCESS:
        217df726-8818-ec29-9076-a8bcb5cb007a:
          x: 556
          'y': 113
