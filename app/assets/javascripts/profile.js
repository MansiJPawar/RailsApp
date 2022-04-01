$(document).ready(function(){

 //validation
   $('.profile-validation').validate({
   rules: {
    'user[first_name]': {
        required: true
      },
      'user[last_name]': {
        required: true
      },
      'user[email]': {
        required: true,
        email: true
      },
      'user[password]': {
        required: true,
        minlength: 8,
        passwordRegex: true
      },
      'user[password_confirmation]': {
        required: true,
        minlength: 8,
        passwordRegex: true,
        equalTo: "#user_password"
      }
    },
    messages: {
      'user[first_name]': {
        required: 'Please enter first name'
      },
      'user[last_name]': {
        required: 'Please enter last name'
      },
      'user[email]': {
        required: 'Please enter email address',
        email: 'Please enter valid email address'
      },
      'user[password]': {
        required: 'Please enter new password',
        minlength: 'Password is too short (minimum is 8 characters)'
      },
      'user[password_confirmation]': {
        required: 'Please enter new confirm password',
        minlength: 'Password is too short (minimum is 8 characters)',
        equalTo: 'Confirm password do not match'
      }
    }
  }); 
});