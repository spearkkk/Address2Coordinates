# Address2Coordinates
Convert from address to coordinates. 

이 코드는 R로 작성된 코드입니다.
Geocoding으로 주어진 주소를 위도, 경도로 변환하여 저장합니다.
변환하는데 사용한 API는 Google Map API이므로 사용하시기 위해서는 API 키를 발급받아야합니다.

기본적으로 제공되는 패키지만이 아니라 "jsonlite" 패키지를 이용했습니다.
이는 API 결과를 파싱하고 원하는 정보를 얻기 위해 사용했습니다.
