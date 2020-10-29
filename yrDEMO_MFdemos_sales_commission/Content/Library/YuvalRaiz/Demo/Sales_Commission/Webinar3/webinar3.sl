namespace: YuvalRaiz.Demo.Sales_Commission.Webinar3
flow:
  name: webinar3
  inputs:
    - deal_size
    - deal_currency
    - commission_rate
  workflow:
    - Google_MoneyConvert:
        do:
          YuvalRaiz.Demo.Sales_Commission.RPA_Activities.Google_MoneyConvert:
            - deal_size: '${deal_size}'
            - deal_currency: '${deal_currency}'
        publish:
          - value_in_usd_to_calc
        navigate:
          - SUCCESS: webinar3_calc_commission
          - WARNING: webinar3_calc_commission
          - FAILURE: on_failure
    - webinar3_calc_commission:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar3.webinar3_calc_commission:
            - commission_rate: '${commission_rate}'
            - deal_size: '${value_in_usd_to_calc}'
        publish:
          - final_commission: '${return_number}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - commission: '${final_commission}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Google_MoneyConvert:
        x: 61
        'y': 114
      webinar3_calc_commission:
        x: 247
        'y': 112
        navigate:
          f34fdc6e-e1dc-91ac-0598-fcf04d8e74b0:
            targetId: fb757af8-b497-98be-5cf0-61bd035016a0
            port: SUCCESS
          151e835d-5aa1-8306-d0c1-d6e3b5bc2451:
            targetId: fb757af8-b497-98be-5cf0-61bd035016a0
            port: WARNING
    results:
      SUCCESS:
        fb757af8-b497-98be-5cf0-61bd035016a0:
          x: 457
          'y': 109
