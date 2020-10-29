namespace: YuvalRaiz.Demo.Sales_Commission.Webinar4
operation:
  name: choose_number
  inputs:
    - number
  python_action:
    use_jython: false
    script: "# do not remove the execute function \ndef execute(): \n    return"
  results:
    - ONE: "${number=='1'}"
      SUCCESS: "${number=='1'}"
    - TWO: "${number=='2'}"
    - THREE: "${number=='3'}"
      CUSTOM_0: "${number=='3'}"
    - OUT_OF_SCOPE
