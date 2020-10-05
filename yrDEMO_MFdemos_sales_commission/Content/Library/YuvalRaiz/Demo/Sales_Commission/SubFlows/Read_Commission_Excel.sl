namespace: YuvalRaiz.Demo.Sales_Commission.SubFlows
flow:
  name: Read_Commission_Excel
  inputs:
    - excel_input_file: /SharedData/RPA_Data/DemoData/mfdemos_commission_demo.xlsx
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${excel_input_file}'
            - first_row_index: null
            - row_index: '1:5'
            - column_delimiter: ;
        publish:
          - return_result
          - rows_count
        navigate:
          - SUCCESS: RegisterCommission
          - FAILURE: on_failure
    - RegisterCommission:
        loop:
          for: "lineCotent in return_result.split('|')"
          do:
            YuvalRaiz.Demo.Sales_Commission.RegisterCommission:
              - account_manager: "${lineCotent.split(';')[0]}"
              - account_manager_email: "${lineCotent.split(';')[1]}"
              - deal_size: "${lineCotent.split(';')[2]}"
              - deal_currency: "${lineCotent.split(';')[3]}"
              - commission: "${lineCotent.split(';')[4]}"
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_cell:
        x: 113
        'y': 204
      RegisterCommission:
        x: 350
        'y': 198
        navigate:
          2ac58d3b-8c26-7934-9602-d1a261a6caa1:
            targetId: 76732911-f673-17e3-6182-c584ae73506b
            port: SUCCESS
    results:
      SUCCESS:
        76732911-f673-17e3-6182-c584ae73506b:
          x: 628
          'y': 197
