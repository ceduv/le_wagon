#====== SCSS ======

# Variables

# Defining a variable
$gray: #F4F4F4;

body {
   background: $gray; // Using this variable
}

# Nesting

.banner {
   background: red;
   h1 {
     font-size: 50px;
   }
}

# Chaining

a {
   color: grey;
   &:hover {
     color: black;
   }
}