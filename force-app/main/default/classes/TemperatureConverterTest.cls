@isTest
public class TemperatureConverterTest {
    @isTest
    static void testWarmTemp(){
        Decimal celcius = TemperatureConverter.FahrenheitToCelsius(70);
        System.assertEquals(21.11,celcius);
    }
    @isTest static void testFreezingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
        System.assertEquals(0,celsius);
    }
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
        System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
    }
}