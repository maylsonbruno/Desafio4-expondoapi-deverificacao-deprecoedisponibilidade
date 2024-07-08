/**
 * @author maylsonbruno
 */
public class InventoryService {

      ProductRepository repository;

    public InventoryService() {
        this.repository = new ProductRepository();
    }

    public Decimal getAvailableQuantity(String sku) {

        return repository.findByStockAvailable(sku);
        
        
    }

}