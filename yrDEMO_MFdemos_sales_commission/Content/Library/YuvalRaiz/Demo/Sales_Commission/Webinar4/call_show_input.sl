namespace: YuvalRaiz.Demo.Sales_Commission.Webinar4
flow:
  name: call_show_input
  inputs:
    - optional_input:
        required: false
    - hidden_input: "${get('optional_input','yuval raiz')}"
    - flow_input_0: default value
    - interactive_input:
        prompt:
          type: text
          message: Please specify a value
  workflow:
    - show_input:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar4.show_input:
            - mandatory_input:
                value: "${get('optional_input', None)}"
                prompt:
                  type: text
                  message: 'No Value entered, please input new value'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      show_input:
        x: 202
        'y': 172
        navigate:
          8c09643d-3c76-4a92-65fa-27a2906b3713:
            targetId: c1e7acd1-43b3-613f-a99d-42eb1a387e20
            port: SUCCESS
    results:
      SUCCESS:
        c1e7acd1-43b3-613f-a99d-42eb1a387e20:
          x: 419
          'y': 175
