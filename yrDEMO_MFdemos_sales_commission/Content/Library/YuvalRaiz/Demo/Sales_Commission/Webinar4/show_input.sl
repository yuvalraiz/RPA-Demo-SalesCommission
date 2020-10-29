namespace: YuvalRaiz.Demo.Sales_Commission.Webinar4
flow:
  name: show_input
  inputs:
    - mandatory_input:
        required: true
  workflow:
    - do_nothing_1:
        loop:
          for: "tmp_name in mandatory_input.split('_')"
          do:
            io.cloudslang.base.utils.do_nothing:
              - input_0: '${tmp_name}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      do_nothing_1:
        x: 241
        'y': 191
        navigate:
          ad00a0b1-63b3-094e-a12b-8cba32e2e75a:
            targetId: b40df512-68ca-8670-9419-3ff74d46efb1
            port: SUCCESS
    results:
      SUCCESS:
        b40df512-68ca-8670-9419-3ff74d46efb1:
          x: 431
          'y': 182
