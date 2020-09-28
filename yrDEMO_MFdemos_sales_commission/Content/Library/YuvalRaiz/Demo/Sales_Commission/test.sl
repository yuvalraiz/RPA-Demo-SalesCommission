namespace: YuvalRaiz.Demo.Sales_Commission
flow:
  name: test
  workflow:
    - Pay:
        do:
          YuvalRaiz.Demo.Sales_Commission.SubFlows.Pay:
            - account_manager: Yuval Raiz
            - account_manager_email: yuval.raiz@mfdemos.com
            - deal_size: '300000'
            - deal_currency: ils
            - commission: '400'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Pay:
        x: 190
        'y': 149
        navigate:
          2b903b61-887e-745f-995d-b521db07e3d0:
            targetId: 6690fdab-2b75-436b-59fd-6241006a104a
            port: SUCCESS
    results:
      SUCCESS:
        6690fdab-2b75-436b-59fd-6241006a104a:
          x: 341
          'y': 127
