namespace: YuvalRaiz.Demo.Sales_Commission.Webinar4
flow:
  name: show_components
  inputs:
    - number:
        required: true
  workflow:
    - choose_number:
        do:
          YuvalRaiz.Demo.Sales_Commission.Webinar4.choose_number:
            - number: '${number}'
        navigate:
          - ONE: One
          - TWO: Two
          - THREE: Others
          - OUT_OF_SCOPE: Others
  results:
    - One
    - Two
    - Others
extensions:
  graph:
    steps:
      choose_number:
        x: 157
        'y': 210
        navigate:
          f231763c-a1ff-5dbd-bb3c-f1faee287aff:
            targetId: 2f3b1749-fd40-f7b7-bf21-83fa09e09655
            port: TWO
          6501adba-feef-41fb-9317-9d8eac2779e9:
            targetId: f8574f11-064c-9af9-5e5e-aec23dc0269e
            port: OUT_OF_SCOPE
          d47d9894-c7fb-ab74-0d90-fa8b3c2e9a9d:
            targetId: aff34568-8f07-49f9-1a64-c5acbe081aee
            port: ONE
          33ef1f35-31be-9b1d-2b1c-8078f2213669:
            targetId: f8574f11-064c-9af9-5e5e-aec23dc0269e
            port: THREE
    results:
      One:
        aff34568-8f07-49f9-1a64-c5acbe081aee:
          x: 409
          'y': 65
      Two:
        2f3b1749-fd40-f7b7-bf21-83fa09e09655:
          x: 402
          'y': 292
      Others:
        f8574f11-064c-9af9-5e5e-aec23dc0269e:
          x: 339
          'y': 473
