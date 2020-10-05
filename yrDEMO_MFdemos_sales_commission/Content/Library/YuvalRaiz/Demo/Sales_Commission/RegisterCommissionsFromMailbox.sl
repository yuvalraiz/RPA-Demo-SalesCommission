namespace: YuvalRaiz.Demo.Sales_Commission
flow:
  name: RegisterCommissionsFromMailbox
  workflow:
    - Get_Commission_Excel:
        do:
          YuvalRaiz.Demo.Sales_Commission.SubFlows.Get_Commission_Excel: []
        publish:
          - excel_file_path
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Read_Commission_Excel
    - Read_Commission_Excel:
        do:
          YuvalRaiz.Demo.Sales_Commission.SubFlows.Read_Commission_Excel:
            - excel_input_file: '${excel_file_path}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Get_Commission_Excel:
        x: 165
        'y': 175
      Read_Commission_Excel:
        x: 364
        'y': 177
        navigate:
          d6f1590c-1229-4487-bb4d-61b3a73d3555:
            targetId: d9d5751d-0831-1d89-3cd7-5cf74709f709
            port: SUCCESS
    results:
      SUCCESS:
        d9d5751d-0831-1d89-3cd7-5cf74709f709:
          x: 551
          'y': 177
