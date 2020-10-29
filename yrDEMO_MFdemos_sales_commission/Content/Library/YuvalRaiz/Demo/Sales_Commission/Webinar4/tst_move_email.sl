namespace: YuvalRaiz.Demo.Sales_Commission.Webinar4
flow:
  name: tst_move_email
  inputs:
    - mailbox_password:
        sensitive: true
    - from_folder
    - to_folder
    - msg_id
  workflow:
    - move_email_between_folders:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar4.move_email_between_folders:
            - mail_server: mail.mfdemos.com
            - username: yuval.raiz@mfdemos.com
            - password:
                value: '${mailbox_password}'
                sensitive: true
            - from_folder: '${from_folder}'
            - to_folder: '${to_folder}'
            - msg_id: '${msg_id}'
        publish:
          - return_code
          - error_message
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      move_email_between_folders:
        x: 196
        'y': 223
        navigate:
          b1e3635f-7063-f0de-32b2-5f80ab0270ad:
            targetId: e86b3c90-a39c-0739-3b08-8ca2bc3dcaa6
            port: SUCCESS
    results:
      SUCCESS:
        e86b3c90-a39c-0739-3b08-8ca2bc3dcaa6:
          x: 467
          'y': 188
