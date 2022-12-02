
describe("Math Functions Test describe", function(){

    it("Test the add2Number test1", function(){
        expect(add2Numbers(2, 4)).toEqual(6);
    });
    
    it("Test the add2Number test2", function(){
        expect(add2Numbers(200, 400)).toEqual(600);
    });
    
    it("Test the add2Number test3", function(){
        expect(add2Numbers(2, -4)).not.toEqual(6);
    });
    
    it("Test the add2Number test4", function(){
        expect(add2Numbers(2, 4)).not.toEqual(50);
    });
    
    
});