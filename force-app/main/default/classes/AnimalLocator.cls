public class AnimalLocator {
    public static string getAnimalNameById(Integer i) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + i);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        string animals ;
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            animals = (string) results.get('animals');
        }
        return animals;
    }
}