/**
 * @author maylsonbruno
 */
public class CheckPriceRequest {

    public String customerCode { get; set; }
    public String shippingCode { get; set; }
    public String sku { get; set; }
    public Decimal quantity { get; set; }
    public String unitOfMeasure { get; set; }
    
}