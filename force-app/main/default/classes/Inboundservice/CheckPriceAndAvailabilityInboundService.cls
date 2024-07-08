/**
 * @author maylsonbruno
 */
@RestResource(urlMapping='/api/priceAvailability')
global class CheckPriceAndAvailabilityInboundService {

    @HttpGet
    global static void checkPriceAndAvailability() {

        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        String customerCode = request.params.get('customerCode');
        String shippingCode = request.params.get('shippingCode');
        String sku = request.params.get('sku');
        Decimal quantity = Decimal.valueOf(request.params.get('quantity'));
        String unitOfMeasure = request.params.get('unitOfMeasure');

        PricingService pricingService = new PricingService();
        InventoryService inventoryService = new InventoryService();

        Decimal unitPrice = pricingService.getUnitPrice(sku);
        Decimal availableQuantity = inventoryService.getAvailableQuantity(sku);

        PriceAndAvailability responsePriceAndAvailability = new PriceAndAvailability();
        responsePriceAndAvailability.unitOfMeasure = unitOfMeasure;
        responsePriceAndAvailability.sku = sku;
        responsePriceAndAvailability.quantity = quantity;
        responsePriceAndAvailability.unitPrice = unitPrice;
        responsePriceAndAvailability.availableQuantity = availableQuantity;
         
        response.responseBody = Blob.valueOf(JSON.serialize(responsePriceAndAvailability));
        response.statusCode = 200;
        
    }

}