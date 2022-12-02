
describe("Hello World Test describe", function(){

it("true to be true it", function(){
    expect(true).toBe(true);
});

it("false to be true it", function(){
    expect(false).toBe(false);
});

it("Hello World it", function(){
    expect(helloWorld()).toEqual("Hello World!");
});

});