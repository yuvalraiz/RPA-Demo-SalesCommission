namespace: YuvalRaiz.Demo.Sales_Commission.RPA_Activities
flow:
  name: test_google_money_convert
  inputs:
    - deal_size
    - deal_currency
  workflow:
    - Google_MoneyConvert:
        do:
          YuvalRaiz.Demo.Sales_Commission.RPA_Activities.Google_MoneyConvert:
            - deal_size: '${deal_size}'
            - deal_currency: '${deal_currency}'
        publish:
          - value_in_usd
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - value_usd: '${value_in_usd}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Google_MoneyConvert:
        x: 170
        'y': 137
        navigate:
          bdaeb75c-d044-6ef1-219f-769092b0ecf6:
            targetId: 78c3fb40-8481-28be-b39c-a342f98a1d27
            port: SUCCESS
          5ac9afe2-1c01-ca7b-b211-a2c2911210c4:
            targetId: 78c3fb40-8481-28be-b39c-a342f98a1d27
            port: WARNING
    results:
      SUCCESS:
        78c3fb40-8481-28be-b39c-a342f98a1d27:
          x: 371
          'y': 54
