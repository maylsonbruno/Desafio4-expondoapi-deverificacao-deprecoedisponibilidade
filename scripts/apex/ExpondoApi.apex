//client_id = 3MVG91oqviqJKoEGSOs6ofGK0EwM6zeRgOfUmlYlyKHlL2gWhKRz4Ass1LbUO6vDJb3jySD7Jcca.VbaCB5bk
//client_secret = 193D6EEAA0792F47987A0EA9114ADEF57C7D8231A30C83F6EE4138B2F7BF9FFD
// Endpoint = https://devforcecamp-dev-ed.develop.my.salesforce.com/services/apexrest/api/priceAvailability
//Endpoint com parametros = https://devforcecamp-dev-ed.develop.my.salesforce.com/services/apexrest/api/priceAvailability?customerCode=1322&shippingCode=2356&sku=GC1060&quantity=1&unitOfMeasure=EA

Product2 product = new Product2(
    Name = 'Test Product',
    ProductCode = 'TESTSKU'
);
insert product;

Pricebook2 standardPricebook = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
PricebookEntry pricebookEntry = new PricebookEntry(
    Pricebook2Id = standardPricebook.Id,
    Product2Id = product.Id,
    UnitPrice = 100.0,
    IsActive = true
);
insert pricebookEntry;

Inventory__c inventory = new Inventory__c(
    Product__c = product.Id,
    Stock__c = 50
);
insert inventory;


RestRequest request = new RestRequest();
request.requestUri = '/services/apexrest/api/priceAvailability';
request.httpMethod = 'GET';
request.addParameter('customerCode', 'CUSTOMERCODE');
request.addParameter('shippingCode', 'SHIPPINGCODE');
request.addParameter('sku', 'TESTSKU');
request.addParameter('quantity', '10');
request.addParameter('unitOfMeasure', 'EA');

RestContext.request = request;


RestResponse response = new RestResponse();
RestContext.response = response;


CheckPriceAndAvailabilityInboundService.checkPriceAndAvailability();


System.debug('Response Status: ' + response.statusCode);
System.debug('Response Body: ' + response.responseBody.toString());