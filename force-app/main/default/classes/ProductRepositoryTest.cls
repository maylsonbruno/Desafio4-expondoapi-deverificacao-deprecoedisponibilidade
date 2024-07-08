/**
 * @author maylsonbruno
 */
@isTest
public class ProductRepositoryTest {
   
    @isTest
   public static void shouldSaveProduct() {

        ProductRepository repository = new ProductRepository();
        Product2 product = new Product2(
            Name = 'New Product',
            ProductCode = 'NEWSKU',
            quantity__c = 1,
            unitOfMeasure__c = 'EA',
            sku__c = 'NEWSK',
            customerCode__c = '1322',
            shippingCode__c = 'NEWSHIPPINGCODE',
            IsActive = true,
            availableQuantity__c = 100.0
           
           
        );

        Product2 savedProduct = repository.save(product);

       
       Assert.areNotEqual(null, savedProduct.Id);
        Assert.areEqual('NEWSKU', savedProduct.ProductCode);
    }

    @isTest
   public static void shouldFindByStockAvailable() {

    Product2 product = new Product2(
        Name = 'New Product',
        ProductCode = 'NEWSKU',
        quantity__c = 1,
        unitOfMeasure__c = 'EA',
        sku__c = 'TESTSKU',
        customerCode__c = '1322',
        shippingCode__c = 'NEWSHIPPINGCODE',
        IsActive = true,
        availableQuantity__c = 100.0
       
       
    );

        ProductRepository repository = new ProductRepository();
        Decimal availableStock = repository.findByStockAvailable('TESTSKU');

       
        Assert.areEqual(50, availableStock);
    }

    @isTest
  public  static void shouldFindByUnitPrice() {

        ProductRepository repository = new ProductRepository();
        Decimal unitPrice = repository.findByUnitPrice('TESTSKU');

        
        Assert.areEqual(100.0, unitPrice);
    }

    @isTest
  public  static void shouldFindByStockAvailableNoStock() {

        ProductRepository repository = new ProductRepository();
        Decimal availableStock = repository.findByStockAvailable('Nao existe sku');

        
        Assert.areEqual(0, availableStock);
    }

    @isTest
  public  static void shouldFindByUnitPriceNoPrice() {

        ProductRepository repository = new ProductRepository();
        Decimal unitPrice = repository.findByUnitPrice('Nao existe sku');

        
        Assert.areEqual(0, unitPrice);
    }
}