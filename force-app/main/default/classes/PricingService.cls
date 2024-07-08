/**
 * @author maylsonbruno
 */
public class PricingService {

    ProductRepository repository;

    public PricingService() {
        this.repository = new ProductRepository();
    }

   
    public Decimal getUnitPrice(String sku) {
           
        return repository.findByUnitPrice(sku);
        
    }

}