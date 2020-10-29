namespace: YuvalRaiz.Demo.Sales_Commission.RPA_Activities
flow:
  name: test_calc
  inputs:
    - deal_size
    - commission_rate
  workflow:
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing:
            - input_0: '35,454.19'
        publish:
          - output_0: "${cs_replace(input_0,',','',)}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - commission: '${commission}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      do_nothing:
        x: 90
        'y': 352
        navigate:
          9ebeb6e2-a1b4-cd63-4e59-0fc7b3955e08:
            targetId: 5c8216ed-54c2-14d5-53bb-830ba48ee006
            port: SUCCESS
    results:
      SUCCESS:
        5c8216ed-54c2-14d5-53bb-830ba48ee006:
          x: 456
          'y': 180
