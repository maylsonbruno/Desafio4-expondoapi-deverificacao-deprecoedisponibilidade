@isTest
public class CheckPriceAndAvailabilityTest {

    @isTest
    static void shouldCheckPriceAndAvailability() {
        
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

        
        Assert.areEqual(200, response.statusCode);
        String responseBody = response.responseBody.toString();
        System.debug('Response Body: ' + responseBody);

        InventoryService inventorService = new InventoryService();

        PricingService pricingService = new PricingService();

        PriceAndAvailability priceAndAvailability = (PriceAndAvailability)JSON.deserialize(responseBody, PriceAndAvailability.class);
        Assert.areEqual('EA', priceAndAvailability.unitOfMeasure);
        Assert.areEqual('TESTSKU', priceAndAvailability.sku);
        Assert.areEqual(10, priceAndAvailability.quantity);
       // Assert.areEqual(100.0,pricingService.getUnitPrice(priceAndAvailability.sku));
        // Assert.areEqual(50.0, inventorService.getAvailableQuantity(priceAndAvailability.sku));
        
    }
}
