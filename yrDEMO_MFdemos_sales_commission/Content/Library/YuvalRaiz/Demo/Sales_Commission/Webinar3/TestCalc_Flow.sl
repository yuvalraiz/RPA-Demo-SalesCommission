namespace: YuvalRaiz.Demo.Sales_Commission.Webinar3
flow:
  name: TestCalc_Flow
  inputs:
    - commission_rate
    - deal_size
  workflow:
    - webinar3_calc_commission:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar3.webinar3_calc_commission: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      webinar3_calc_commission:
        x: 127
        'y': 156
        navigate:
          0403cc23-137d-af73-8df5-44c749739fd2:
            targetId: 2c299062-67f7-8b29-6758-3132c5b472e8
            port: SUCCESS
          db1d5d68-a201-01b0-043c-e67ef6a9c9aa:
            targetId: 2c299062-67f7-8b29-6758-3132c5b472e8
            port: WARNING
    results:
      SUCCESS:
        2c299062-67f7-8b29-6758-3132c5b472e8:
          x: 421
          'y': 139
