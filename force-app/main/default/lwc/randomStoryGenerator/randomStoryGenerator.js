import { LightningElement,track } from 'lwc';
    
export default class RandomStoryGenerator extends LightningElement {
    countryValue;
    customerName;
    story;
    get options() {
        return [
            { label: 'US', value: 'option1' },
            { label: 'UK', value: 'option2' },
        ];
    }

    randomValueFromArray(array) {
        let random = Math.floor(Math.random() * array.length);
        console.log('Random'+ random);
        return array[random];
        
    }

    //On Radio Option Change Function
    onOptionChange(event) {
        this.countryValue = event.target.value;
    }

    //Customer Input Change Event
    handleInputChange(event) {
        this.customerName = event.target.value;
    }
    storyText= 'It was 94 fahrenheit outside, so :insertx: went for a walk. When they got to :inserty:, they stared in horror for a few moments, then :insertz:. Bob saw the whole thing, but was not surprised — :insertx: weighs 300 pounds, and it was a hot day.';
    insertx = ['Willy the Goblin', 'Big Daddy', 'Father Chrismas'];
    inserty = ['the soup kitchen', 'Disneyland', 'the White House'];
    insertz = ['spontaneously combusted', 'melted into a puddle on the sidewalk', 'turned into a slug and crawled away'];

    //Custom Logic Handler Functions
    randomize(){
        let newStory = this.storyText;
        let xItem = this.randomValueFromArray(this.insertx);
        let yItem = this.randomValueFromArray(this.inserty);
        let zItem = this.randomValueFromArray(this.insertz);

        newStory = newStory.replaceAll(':insertx:', xItem);
        newStory = newStory.replaceAll(':inserty:', yItem);
        newStory = newStory.replaceAll(':insertz:', zItem);

        if (this.customerName !== '') {
            console.log('Inside Customer Name Logic');
            newStory = newStory.replaceAll('Bob', this.customerName);
        }
        if (this.countryValue === 'option2') {
            let weight = `${Math.round(300 * 0.0714286)} stone`;
            let temperature = `${Math.round((94 - 32) * 5 / 9)} centigrade`;
            newStory = newStory.replaceAll('94 fahrenheit', temperature);
            newStory = newStory.replaceAll('300 pounds', weight);
        }

        this.story = newStory;
    }

    //Generate Story Button Handler
    handleOnClick() {
        return this.randomize();

    }

}