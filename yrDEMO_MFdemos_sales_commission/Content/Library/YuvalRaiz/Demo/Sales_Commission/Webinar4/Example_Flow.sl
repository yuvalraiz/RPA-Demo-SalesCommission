namespace: YuvalRaiz.Demo.Sales_Commission.Webinar4
flow:
  name: Example_Flow
  inputs:
    - can_be_empty:
        required: false
    - can_be_empty_with_default:
        default: "${get('can_be_empty','was empty')}"
        private: true
    - required_with_default
  workflow:
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      do_nothing:
        x: 277
        'y': 169
        navigate:
          a918a89a-5b5e-af1d-faff-92f9085dc659:
            targetId: e8a1390b-c8ce-0590-b61d-04b11d5f1ed1
            port: SUCCESS
    results:
      SUCCESS:
        e8a1390b-c8ce-0590-b61d-04b11d5f1ed1:
          x: 409
          'y': 117
