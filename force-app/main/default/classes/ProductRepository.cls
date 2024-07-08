/**
 * @author maylsonbruno
 */

public class ProductRepository {
   
    public Product2 save(Product2 product){

        upsert product;
        return product;
    }

    public Decimal findByStockAvailable(String sku) {

        List<Inventory__c> inventoryRecords = [
            SELECT Stock__c 
            FROM Inventory__c 
            WHERE Product__r.sku__c = :sku
            LIMIT 1
        ];

          if (!inventoryRecords.isEmpty()) {
            return inventoryRecords[0].Stock__c;
        } else {
            
            return 0; 
        }
        
    }

    public Decimal findByUnitPrice(String sku){

        List<PricebookEntry> pricebookEntries = [
            SELECT UnitPrice 
            FROM PricebookEntry 
            WHERE Product2.ProductCode = :sku
            AND Pricebook2.IsActive = true
            LIMIT 1
        ];

        if (!pricebookEntries.isEmpty()) {
            return pricebookEntries[0].UnitPrice;
        } else {
            
            return 0; 
        }
    }


}