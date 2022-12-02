//document.cookie = "my_cookie_name=my_cookie_value; expires=Thu, 11 Jun 2070 11:11:11 UTC; path=/; SameSite=None; Secure";

const submitToSubscribe = document.querySelector('#submit-to-subscribe');


const saveStudentRecord = async ()=>{

// At 1:41 Session 14
let studentIdValue = document.getElementById('student-id').value 
let studentNameValue = document.getElementById('student-name').value 
let studentEemailValue = document.getElementById('student-email').value 
let studentPhoneValue = document.getElementById('student-phone').value 
let studentNotesValue = document.getElementById('student-notes').value 

let getResponse = await fetch('http://localhost:8088/students/');

let postResponse = await fetch('http://localhost:8088/savethestudent/', {
method: 'POST', 
headers: {
    'Accept': 'application/json',
    'dataType':'json',
    'Content-Type': ['application/json', 'text/html', 'text/xml', 'text/css' ],
    'X-Content-Type-Options': 'nosniff'
},
body: json.stringfy({
    studentId: studentIdValue,
    studentName: studentNameValue,
    studentEmail: studentEemailValue,
    studentPhone:studentPhoneValue, 
    studentNotes: studentNotesValue 
})


});

console.log(postResponse);
document.getElementById('subscribeDataEntryForm').reset();
$('subscribeOuterModal').modal('toggle');
$('AckModal').modal('toggle');
}

/*
function getStudentRecord(){
   // console.log('fetchButton clicked');
    //alert('fetchButton clicked');
    // let getResponse = await fetch('http://localhost:8088/students/');
    // console.log(getResponse);
    
};
  */
 
/*
function getStudentRecord(){
    // document.getElementById("fetchButton").click();

    let getResponse = fetch('http://localhost:8088/students/');
    
    console.log(getResponse);
    alert('fetchButton clicked');
};
*/
 

// fetchButton.addEventListener('click', getStudentRecord());

//submitToSubscribe.addEventListener('click', saveStudentRecord);

