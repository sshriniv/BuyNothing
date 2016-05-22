//document ready will not work with turbolinks turned on. Either turn off turbolinks or use the jquery-turbolinks gem
//If you want to operate on an element inserted via ajax, the .ready event will not work. Ajax does not trigger
//a document ready event. It triggers a document ajaxComplete event. Use this instead for performing operations 
//on elements inserted by ajax requests.


//'Cancel' button for comment comment
$( document ).ajaxComplete(function() {
    $('#cancel-comment').click(function (event) {
    $(this).closest('form').remove();
    event.preventDefault();
    });
});





/*$(document).ready(function(){
    $('#comment_1').click(function (event) {
    alert('Hooray!');
    });


});*/

