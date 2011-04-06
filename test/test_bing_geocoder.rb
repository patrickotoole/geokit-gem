require File.join(File.dirname(__FILE__), 'test_base_geocoder')

Geokit::Geocoders::bing = 'Bing'

class BingGeocoderTest < BaseGeocoderTest #:nodoc: all
  
  BING_FULL=<<-EOF.strip
  <?xml version="1.0" encoding="utf-8"?><Response xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/search/local/ws/rest/v1"><Copyright>Copyright © 2010 Microsoft and its suppliers. All rights reserved. This API cannot be accessed and the content and any results may not be used, reproduced or transmitted in any manner without express written permission from Microsoft Corporation.</Copyright><BrandLogoUri>http://dev.virtualearth.net/Branding/logo_powered_by.png</BrandLogoUri><StatusCode>200</StatusCode><StatusDescription>OK</StatusDescription><AuthenticationResultCode>ValidCredentials</AuthenticationResultCode><TraceId>8c88d2fa862c440b85fcc4dacecb346c|LTSPLAT004|02.00.103.1000|LTS-VE-GEFE007, LTS-VE-GEFP001, LTS-VE-GSES002, LTS-VE-GSIT001</TraceId><ResourceSets><ResourceSet><EstimatedTotal>1</EstimatedTotal><Resources><Location><Name>100 Spear St, San Francisco, CA 94105-1522</Name><Point><Latitude>37.792156</Latitude><Longitude>-122.394012</Longitude></Point><BoundingBox><SouthLatitude>37.788293282429322</SouthLatitude><WestLongitude>-122.4005290428604</WestLongitude><NorthLatitude>37.796018717570675</NorthLatitude><EastLongitude>-122.38749495713961</EastLongitude></BoundingBox><EntityType>Address</EntityType><Address><AddressLine>100 Spear St</AddressLine><AdminDistrict>CA</AdminDistrict><AdminDistrict2>San Francisco Co.</AdminDistrict2><CountryRegion>United States</CountryRegion><FormattedAddress>100 Spear St, San Francisco, CA 94105-1522</FormattedAddress><Locality>San Francisco</Locality><PostalCode>94105-1522</PostalCode></Address><Confidence>High</Confidence></Location></Resources></ResourceSet></ResourceSets></Response>
  EOF
  
  BING_CITY=<<-EOF.strip
  <?xml version="1.0" encoding="utf-8"?><Response xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/search/local/ws/rest/v1"><Copyright>Copyright © 2010 Microsoft and its suppliers. All rights reserved. This API cannot be accessed and the content and any results may not be used, reproduced or transmitted in any manner without express written permission from Microsoft Corporation.</Copyright><BrandLogoUri>http://dev.virtualearth.net/Branding/logo_powered_by.png</BrandLogoUri><StatusCode>200</StatusCode><StatusDescription>OK</StatusDescription><AuthenticationResultCode>ValidCredentials</AuthenticationResultCode><TraceId>add7a2f2310a4b7e94a7fdd1f652cc14|LTSPLAT001|02.00.103.1000|LTS-VE-GEFE002, LTS-VE-GEFP004, LTS-VE-GEFP003, LTS-VE-GSUS002</TraceId><ResourceSets><ResourceSet><EstimatedTotal>5</EstimatedTotal><Resources><Location><Name>San Francisco, CA</Name><Point><Latitude>37.779160067439079</Latitude><Longitude>-122.42004945874214</Longitude></Point><BoundingBox><SouthLatitude>37.653094902634621</SouthLatitude><WestLongitude>-122.63075239956379</WestLongitude><NorthLatitude>37.905010655522346</NorthLatitude><EastLongitude>-122.20934651792049</EastLongitude></BoundingBox><EntityType>PopulatedPlace</EntityType><Address><AdminDistrict>CA</AdminDistrict><AdminDistrict2>San Francisco Co.</AdminDistrict2><CountryRegion>United States</CountryRegion><FormattedAddress>San Francisco, CA</FormattedAddress><Locality>San Francisco</Locality></Address><Confidence>Medium</Confidence></Location><Location><Name>San Francisco, Argentina</Name><Point><Latitude>-31.429010108113289</Latitude><Longitude>-62.08468571305275</Longitude></Point><BoundingBox><SouthLatitude>-31.457980491105847</SouthLatitude><WestLongitude>-62.1299404256775</WestLongitude><NorthLatitude>-31.400039725120731</NorthLatitude><EastLongitude>-62.039431000427996</EastLongitude></BoundingBox><EntityType>PopulatedPlace</EntityType><Address><AdminDistrict>Cordoba</AdminDistrict><CountryRegion>Argentina</CountryRegion><FormattedAddress>San Francisco, Argentina</FormattedAddress><Locality>San Francisco</Locality></Address><Confidence>High</Confidence></Location><Location><Name>San Francisco, Mexico</Name><Point><Latitude>24.323177263140678</Latitude><Longitude>-102.88223214447498</Longitude></Point><BoundingBox><SouthLatitude>24.294206880148121</SouthLatitude><WestLongitude>-102.92461230377626</WestLongitude><NorthLatitude>24.352147646133236</NorthLatitude><EastLongitude>-102.83985198517371</EastLongitude></BoundingBox><EntityType>PopulatedPlace</EntityType><Address><AdminDistrict>ZAC</AdminDistrict><CountryRegion>Mexico</CountryRegion><FormattedAddress>San Francisco, Mexico</FormattedAddress><Locality>San Francisco</Locality></Address><Confidence>High</Confidence></Location><Location><Name>San Francisco, Philippines</Name><Point><Latitude>13.350468054413796</Latitude><Longitude>122.52349086105824</Longitude></Point><BoundingBox><SouthLatitude>13.321497671421238</SouthLatitude><WestLongitude>122.48379558108556</WestLongitude><NorthLatitude>13.379438437406353</NorthLatitude><EastLongitude>122.56318614103091</EastLongitude></BoundingBox><EntityType>PopulatedPlace</EntityType><Address><CountryRegion>Philippines</CountryRegion><FormattedAddress>San Francisco, Philippines</FormattedAddress><Locality>San Francisco</Locality></Address><Confidence>High</Confidence></Location><Location><Name>San Francisco, Mexico</Name><Point><Latitude>27.633300796151161</Latitude><Longitude>-112.98300080001354</Longitude></Point><BoundingBox><SouthLatitude>27.604330413158603</SouthLatitude><WestLongitude>-113.02658977519526</WestLongitude><NorthLatitude>27.662271179143719</NorthLatitude><EastLongitude>-112.93941182483182</EastLongitude></BoundingBox><EntityType>PopulatedPlace</EntityType><Address><AdminDistrict>BCS</AdminDistrict><CountryRegion>Mexico</CountryRegion><FormattedAddress>San Francisco, Mexico</FormattedAddress><Locality>San Francisco</Locality></Address><Confidence>High</Confidence></Location></Resources></ResourceSet></ResourceSets></Response>
  EOF

  BING_ADDRESS=<<-EOF.strip
  <?xml version="1.0" encoding="utf-8"?><Response xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/search/local/ws/rest/v1"><Copyright>Copyright © 2010 Microsoft and its suppliers. All rights reserved. This API cannot be accessed and the content and any results may not be used, reproduced or transmitted in any manner without express written permission from Microsoft Corporation.</Copyright><BrandLogoUri>http://dev.virtualearth.net/Branding/logo_powered_by.png</BrandLogoUri><StatusCode>200</StatusCode><StatusDescription>OK</StatusDescription><AuthenticationResultCode>ValidCredentials</AuthenticationResultCode><TraceId>0d1b98817b9f4d028e63ba98c9c2ffcc|AMSPLAT002|02.00.103.1000|AMS-VE-GEFE003, AMS-VE-GEFP001, AMS-VE-GEFP002, AMS-VE-GSUS002, AMS-VE-GSUK002</TraceId><ResourceSets><ResourceSet><EstimatedTotal>1</EstimatedTotal><Resources><Location><Name>10 Downing Street, London SW1A 2</Name><Point><Latitude>51.503212000000005</Latitude><Longitude>-0.12765147</Longitude></Point><BoundingBox><SouthLatitude>51.499349282429328</SouthLatitude><WestLongitude>-0.13592471575377288</WestLongitude><NorthLatitude>51.507074717570681</NorthLatitude><EastLongitude>-0.11937822424622711</EastLongitude></BoundingBox><EntityType>Address</EntityType><Address><AddressLine>10 Downing Street</AddressLine><AdminDistrict>England</AdminDistrict><CountryRegion>United Kingdom</CountryRegion><FormattedAddress>10 Downing Street, London SW1A 2</FormattedAddress><Locality>London</Locality><PostalCode>SW1A 2</PostalCode></Address><Confidence>High</Confidence></Location></Resources></ResourceSet></ResourceSets></Response>
  EOF

  BING_MULTI=<<-EOF.strip
  <?xml version="1.0" encoding="utf-8"?><Response xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/search/local/ws/rest/v1"><Copyright>Copyright © 2010 Microsoft and its suppliers. All rights reserved. This API cannot be accessed and the content and any results may not be used, reproduced or transmitted in any manner without express written permission from Microsoft Corporation.</Copyright><BrandLogoUri>http://dev.virtualearth.net/Branding/logo_powered_by.png</BrandLogoUri><StatusCode>200</StatusCode><StatusDescription>OK</StatusDescription><AuthenticationResultCode>ValidCredentials</AuthenticationResultCode><TraceId>76d7c444b85b4dfbb646433bfe8d749b|LTSPLAT007|02.00.103.1000|LTS-VE-GEFE006, LTS-VE-GEFP004, LTS-VE-GEFP003, LTS-VE-GEFP001, LTS-VE-GSUS004</TraceId><ResourceSets><ResourceSet><EstimatedTotal>4</EstimatedTotal><Resources><Location><Name>Lagos, Nigeria</Name><Point><Latitude>6.4921548217535019</Latitude><Longitude>3.372822180390358</Longitude></Point><BoundingBox><SouthLatitude>6.463184438760945</SouthLatitude><WestLongitude>3.3339479321729457</WestLongitude><NorthLatitude>6.5211252047460588</NorthLatitude><EastLongitude>3.4116964286077702</EastLongitude></BoundingBox><EntityType>PopulatedPlace</EntityType><Address><CountryRegion>Nigeria</CountryRegion><FormattedAddress>Lagos, Nigeria</FormattedAddress><Locality>Lagos</Locality></Address><Confidence>High</Confidence></Location><Location><Name>Lagos, Portugal</Name><Point><Latitude>37.103354707360268</Latitude><Longitude>-8.6722496151924133</Longitude></Point><BoundingBox><SouthLatitude>37.074384324367713</SouthLatitude><WestLongitude>-8.7206634891918888</WestLongitude><NorthLatitude>37.132325090352822</NorthLatitude><EastLongitude>-8.6238357411929378</EastLongitude></BoundingBox><EntityType>PopulatedPlace</EntityType><Address><AdminDistrict>Faro</AdminDistrict><CountryRegion>Portugal</CountryRegion><FormattedAddress>Lagos, Portugal</FormattedAddress><Locality>Lagos</Locality></Address><Confidence>High</Confidence></Location><Location><Name>Los Lagos, FL</Name><Point><Latitude>28.081581071019173</Latitude><Longitude>-81.955322250723839</Longitude></Point><BoundingBox><SouthLatitude>28.075331524014473</SouthLatitude><WestLongitude>-81.964686512947083</WestLongitude><NorthLatitude>28.087829947471619</NorthLatitude><EastLongitude>-81.9459579885006</EastLongitude></BoundingBox><EntityType>Neighborhood</EntityType><Address><AdminDistrict>FL</AdminDistrict><AdminDistrict2>Polk Co.</AdminDistrict2><CountryRegion>United States</CountryRegion><FormattedAddress>Los Lagos, FL</FormattedAddress><Locality>Los Lagos</Locality></Address><Confidence>High</Confidence></Location><Location><Name>Dos Lagos, CA</Name><Point><Latitude>33.815716132521629</Latitude><Longitude>-117.50461913645268</Longitude></Point><BoundingBox><SouthLatitude>33.800792321562767</SouthLatitude><WestLongitude>-117.52836607396603</WestLongitude><NorthLatitude>33.830637261271477</NorthLatitude><EastLongitude>-117.48087219893932</EastLongitude></BoundingBox><EntityType>Neighborhood</EntityType><Address><AdminDistrict>CA</AdminDistrict><AdminDistrict2>Riverside Co.</AdminDistrict2><CountryRegion>United States</CountryRegion><FormattedAddress>Dos Lagos, CA</FormattedAddress><Locality>Dos Lagos</Locality></Address><Confidence>High</Confidence></Location></Resources></ResourceSet></ResourceSets></Response>
  EOF

  def test_bing_full_address
    result = mock_response(BING_FULL)
    assert_equal "CA", result.state
    assert_equal "San Francisco", result.city 
    assert_equal "37.792156,-122.394012", result.ll
    assert_equal "100 Spear St, San Francisco, CA 94105-1522", result.full_address
    assert_equal "bing", result.provider
    assert_equal "address", result.precision
  end
  
  def test_bing_full_address_accuracy
    result = mock_response(BING_FULL)
    assert_equal 8, result.accuracy
  end
  
  def test_bing_city
    result = mock_response(BING_CITY)
    assert_equal "CA", result.state
    assert_equal "San Francisco", result.city
    assert_equal "37.7791600674391,-122.420049458742", result.ll
    assert_equal "San Francisco, CA", result.full_address
    assert_equal "bing", result.provider
    assert_equal "city", result.precision
    assert_nil    result.street_address
  end

  def test_bing_address
    result = mock_response(BING_ADDRESS)
    assert_equal 'London', result.city
    assert_equal '10 Downing Street, London SW1A 2', result.full_address
  end

  def test_bing_city_accuracy
    result = mock_response(BING_CITY)
    assert_equal 5, result.accuracy
  end
    
  def test_bing_suggested_bounds
    result = mock_response(BING_FULL)
    assert_instance_of Geokit::Bounds, result.suggested_bounds
  end
  
  def test_service_unavailable
    result = mock_response('')
    assert !result.success
  end 
  
  def test_multiple_results
    result = mock_response(BING_MULTI)
    assert_equal 4, result.all.size

    assert_equal "Lagos",         result.city
    assert_equal "Nigeria",       result.country

    assert_equal "Lagos",         result.all[1].city
    assert_equal "Portugal",      result.all[1].country

    assert_equal "Los Lagos",     result.all[2].city
    assert_equal "United States", result.all[2].country

    assert_equal "Dos Lagos",     result.all[3].city
    assert_equal "United States", result.all[3].country
  end
    
private
  
  def mock_response(response_str)
    response = MockSuccess.new
    response.expects(:body).returns(response_str)
    url = "http://dev.virtualearth.net/REST/v1/Locations/input?key=#{Geokit::Geocoders::bing}&o=xml"
    Geokit::Geocoders::BingGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    Geokit::Geocoders::BingGeocoder.geocode('input')
  end
end
