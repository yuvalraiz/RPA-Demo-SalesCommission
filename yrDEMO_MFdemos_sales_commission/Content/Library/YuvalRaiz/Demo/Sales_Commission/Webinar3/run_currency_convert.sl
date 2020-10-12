namespace: YuvalRaiz.Demo.Sales_Commission.Webinar3
flow:
  name: run_currency_convert
  inputs:
    - deal_size
    - deal_currency
    - commission_rate
  workflow:
    - MoneyConvert:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar3.MoneyConvert:
            - amount: '${deal_size}'
            - from_currency: '${deal_currency}'
            - to_currency: usd
        publish:
          - deal_size_in_usd: '${param1}'
        navigate:
          - SUCCESS: webinar3_calc_commission
          - WARNING: webinar3_calc_commission
          - FAILURE: on_failure
    - webinar3_calc_commission:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar3.webinar3_calc_commission:
            - commission_rate: '${commission_rate}'
            - deal_size: '${deal_size_in_usd}'
        publish:
          - commission_value: '${return_number}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - commission_value: '${commission_value}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      MoneyConvert:
        x: 75
        'y': 158
      webinar3_calc_commission:
        x: 252
        'y': 176
        navigate:
          75242e7d-8843-269f-453f-578fb85bd9d4:
            targetId: 5f56c3a2-f244-5330-ceb0-22c986643079
            port: WARNING
          49d30019-2880-21bb-7b85-0d003a8cb2ed:
            targetId: 5f56c3a2-f244-5330-ceb0-22c986643079
            port: SUCCESS
    results:
      SUCCESS:
        5f56c3a2-f244-5330-ceb0-22c986643079:
          x: 696
          'y': 154
