public class YoutubeController {
    public String body {get;set;}
    List<SuperItemWrapper> listOfSuperItemWrapper = new List<SuperItemWrapper>();
    
    public void search(){
        //business logic
        String endpoint ='https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=pewdipie&key=AIzaSyAzh4RuYPsfssWoVzegVPJB1MGco2mGVp4';
        
        //1.Instantiate Http class
        Http http = new Http();
        
        //2.Instantiate HttpRequest class and frame the request
        HttpRequest request = new HttpRequest();
        request.setHeader('Accept', 'application/json');
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        //3.Send the request and handle the response
        HttpResponse response = http.send(request);
        body = response.getBody();
        
        //Deserilazing the Body to fromJSON Apex Class
        fromJSON d = (fromJSON)JSON.deserialize(body, fromJSON.class);
        
        for(Integer i = 0; i < d.items.size() ; i++){
            SuperItemWrapper superObj = new SuperItemWrapper();
            superObj.title = d.items[i].snippet.title;
            superObj.description = d.items[i].snippet.description;
            superObj.url = d.items[i].snippet.thumbnails.medium.url;
            superObj.publishTime = d.items[i].snippet.publishTime;
            listOfSuperItemWrapper.add(superObj);
        }
        System.debug('DEBUG::::'+ listOfSuperItemWrapper);
    }
    
    public class SuperItemWrapper{
        public String title;
        public String description;
        public String url;
        public String publishTime;
    }
    
    public class fromJSON{
        public String kind;	//youtube#searchListResponse
        public String etag;	//4VBpaa9tcIF0zhXSn0r2nFi5nAg
        public String nextPageToken;	//CAUQAA
        public String regionCode;	//IN
        public cls_pageInfo pageInfo;
        public cls_items[] items;
        
    }
    class cls_pageInfo {
        public Integer totalResults;	//321801
        public Integer resultsPerPage;	//5
    }
    class cls_items {
        public String kind;	//youtube#searchResult
        public String etag;	//hPgv4cF0sTql4EEFbRVrn6bROwg
        public cls_id id;
        public cls_snippet snippet;
    }
    class cls_id {
        public String kind;	//youtube#channel
        public String channelId;	//UC-lHJZR3Gqxm24_Vd_AJ5Yw
    }
    class cls_snippet {
        public String publishedAt;	//2010-04-29T10:54:00Z
        public String channelId;	//UC-lHJZR3Gqxm24_Vd_AJ5Yw
        public String title;	//PewDiePie
        public String description;	//I make videos.
        public cls_thumbnails thumbnails;
        public String channelTitle;	//PewDiePie
        public String liveBroadcastContent;	//none
        public String publishTime;	//2010-04-29T10:54:00Z
    }
    class cls_thumbnails {
        public cls_default default_x;
        public cls_medium medium;
        public cls_high high;
    }
    class cls_default {
        public String url;	//https://yt3.ggpht.com/5oUY3tashyxfqsjO5SGhjT4dus8FkN9CsAHwXWISFrdPYii1FudD4ICtLfuCw6-THJsJbgoY=s88-c-k-c0xffffffff-no-rj-mo
    }
    class cls_medium {
        public String url;	//https://yt3.ggpht.com/5oUY3tashyxfqsjO5SGhjT4dus8FkN9CsAHwXWISFrdPYii1FudD4ICtLfuCw6-THJsJbgoY=s240-c-k-c0xffffffff-no-rj-mo
    }
    class cls_high {
        public String url;	//https://yt3.ggpht.com/5oUY3tashyxfqsjO5SGhjT4dus8FkN9CsAHwXWISFrdPYii1FudD4ICtLfuCw6-THJsJbgoY=s800-c-k-c0xffffffff-no-rj-mo
    }
    
}