// create travel class 
class Travel {
    _name: string;
 
    // constructor
    constructor(){
        this._name = 'Outdoor Adventures and Travel'
    }
    
    // get name
    getName(){
        return this._name;
    }
 
    // set name
    setName(name: string){
        this._name = name;
    }
 
    // method to suggest outdoor activities - hiking 
    suggestHiking(){
        console.log('Hiking is great way to explore nature and get exercise!');
    }
 
    // method to suggest outdoor activities - kayaking 
    suggestKayaking(){
        console.log('Kayaking is a great way to explore rivers and lakes, and get wet while doing it!');
    }
 
    // method to suggest outdoor activities - walking 
    suggestWalking(){
        console.log('Walking is a great way to explore cities and get familiar with the local culture!');
    }
 
    // method to suggest outdoor activities - camping 
    suggestCamping(){
        console.log('Camping is a great way to explore the wilderness and discover some remote locations!');
    }
 
    // method to suggest travel activities - sightseeing 
    suggestSightseeing(){
        console.log('Sightseeing is a great way to explore cities all over the world!');
    }
 
    // method to suggest travel activities - backpacking 
    suggestBackpacking(){
        console.log('Backpacking is a great way to explore countries at your own pace!');
    }
 
    // method to suggest travel activities - train trips
    suggestTrainTrips(){
        console.log('Train trips are a great way to explore countries with a slower pace - enjoy the view!');
    }
}
 
// create instance of class 
let myTravel = new Travel()
let name = myTravel.getName();
 
// methods 
myTravel.suggestHiking();
myTravel.suggestKayaking();
myTravel.suggestWalking();
myTravel.suggestCamping();
myTravel.suggestSightseeing();
myTravel.suggestBackpacking();
myTravel.suggestTrainTrips();