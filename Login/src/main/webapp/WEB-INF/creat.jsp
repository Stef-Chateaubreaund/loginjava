<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="UTF-8">
        <title>Responsive Registaration Form</title>
    <link rel="stylesheet" type="text/css" href="/css/segundo.css">
        <script type="text/javascript" lang="javascript" src="./responsiveRegistaration.js"></script>
    </head>
       
    <body>
        <h1> Dont have an account yet? Sign up! </h1>
        
<form:form action="/register" method="post" modelAttribute="newUser">


        <div class="container">
            <div class="row">
                <div class="col-10">
                    <label for="fname">Name:</label>
                </div>
                <div class="col-90">
                <form:errors path="fname" class="text-danger"/>
                <form:input type="text" class="input" id="fname" name="firstname" placeholder="Enter your first name"/>
                </div>
            
<!--             <div class="row">
                <div class="col-10">
                    <label for="lname">Last Name:</label>
                </div> -->
             <!--    <div class="col-90">
                    <input type="text" id="lname" name="lastname" placeholder="Enter your last name">
                </div> -->
            </div>
            <div class="row">
                <div class="col-10">
                    <label for="email">Email:</label>
                </div>
                <div class="col-90">
                <form:errors path="email" class="text-danger"/>
                    <form:input type="email" class="input" id="email" name="email" placeholder="it should contain @,."/>
                </div>
            </div>
           <!--  <div class="row">
                <div class="col-10">
                    <label for="mobile">Mobile:</label>
                </div>
                <div class="col-90">
                    <input type="tel" id="mobile" name="mobile" placeholder="only 10 digits are allowed">
                </div>
            </div> -->
            <div class="row">
                <div class="col-10">
                    <label for="gender" required>Gender:</label>
                    <form:errors path="gender" class=" input"/>
                    
                    
                </div>
                <div class="col-90">
                    <form:input type="radio" id="male" name="gender" value="male"/>Male
                    <form:input type="radio" id="female" name="gender" value="female"/>Female
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <label for="dob">Date Of Birth:</label>
                </div>
                <div class="col-90">
                <form:errors path="confirm" class="text-danger"/>
                    <form:input type="Date" id="dob" name="dob"/>
                </div>
            </div>
          <!--   <div class="row">
                <div class="col-10">
                    <label for="address">Address:</label>
                </div>
                <div class="col-90">
                    <textarea name="address" id="address" cols="30" rows="10"></textarea>
                </div>
            </div> -->
<!--             <div class="row">
                <div class="col-10">
                    <label for="city">City:</label>
                </div>
                <div class="col-90">
                    <input type="text" id="city" name="city" maxlength="10">
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <label for="pincode">Area PIN:</label>
                </div>
                <div class="col-90">
                    <input type="number" id="pin" name="pin" maxlength="6">
                </div>
            </div> -->
         <!--    <div class="row">
                <div class="col-10">
                    <label for="state">State:</label>
                </div>
                <div class="col-90">
                    <input type="text" id="state" name="state">
                </div>
            </div> -->
            <div class="row">
                <div class="col-10">
                    <label for="qualification" required >Favorite Genres?:</label>
                </div>
                <div class="col-90">
                    <select name="qualification" id="qualification">
                        <option value=" ">Select one</option>
                        <option value="Graduation">Fairy Tale</option>
                        <option value="BTech.">Drama</option>
                        <option value="MTech.">Romance</option>
                        <option value="MCA">Fiction</option>
                        <option value="BCA">Fantasy</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <label for="specialization">How did you discovered us?</label>
                </div>
                <div class="col-90">
                    <form:input type="checkbox" class="specialization" id="cs" name="specialization[]" value="Computer Science"/>Friends<br/>
                    <form:input type="checkbox" class="specialization" id="it" name="specialization[]" value="Information Technology"/>Internet<br/>
                    <form:input type="checkbox" class="specialization" id="ca" name="specialization[]" value="Computer Architecture"/>Social Media<br/>
<!--                     <input type="checkbox" class="specialization" id="tc" name="specialization[]" value="Tele Communication"><br/> -->
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <label for="password">Password:</label>
                    <form:errors path="password" class="text-danger"/>
                </div>
                <div class="col-90">
                    <form:input type="password" id="password" placeholder="please type your password" name="password" />
                </div>
            </div>
           
             <div class="row">
                <div class="col-10">
                    <label for="password">Confirm Password:</label>
                    <form:errors path="confirmpassword" class="text-danger"/>
                </div>
                <div class="col-90">
                    <form:input type="password" id="password"  placeholder="please confirm your password" name="password" maxlength="8">
                
                 <div class="row">
                <input type="submit" value="Register" >
            </div>  </div>
            
            </form:form></div>
             
        </div>  
    </body>
</html>