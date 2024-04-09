<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="First.aspx.cs" Inherits="BookStore___Fuentes.WebForm4" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Welcome to Books of Sophia</title>
  <style>
    body { font-family: Arial, sans-serif; 
           background-color: #f4f4f4;
            margin: 0;
             text-align: center;
               background-image: url('https://images.alphacoders.com/132/thumbbig-1326370.webp');
    }
    header { background-color: #348494; color: white; padding: 20px; }
    .intro-text { margin: 50px auto; width: 700px; font-size: 1.5em; background-color: rgba(255, 255, 255, 0.8);
                  padding: 20px; border-radius: 10px; text-align: justify; }
    .cta-button { display: inline-block; padding: 10px 20px; background-color: #348494; color: white;
                  text-decoration: none; border-radius: 5px; transition: background-color 0.3s ease; }
    .cta-button:hover { background-color: #f57c00; }
    .slider { max-width: 80%; margin: 20px auto; overflow: hidden; position: relative; }
   .card {
        width: 250px; /* Adjust the card width if needed */
        height: 400px; /* Adjust the card height if needed */
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: auto;
        display: inline-block;
        padding: 15px;
         box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }

    .card img {
        width: 100%; /* Make the image fill the card */
        height: 100%; /* Make the image fill the card */
        object-fit: cover; /* Maintain aspect ratio and cover the card */
        border-radius: 8px; /* Keep the border radius of the image */
    }
        .slider {
        position: relative;
        max-width: 40%;
        margin: 20px auto;
        overflow: hidden;
        /* Adjust the display property to flex to align items */
        display: flex;
        justify-content: center; /* Center the items horizontally */
        align-items: center; /* Center the items vertically */
    }

    .prev, .next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        font-size: 24px;
        padding: 10px;
        color: white;
        background-color: #348494;
        border-radius: 30%;
        z-index: 1;
    }

    .prev {
        left: 0; /* Position the 'prev' button to the left */
    }

    .next {
        right: 0; /* Position the 'next' button to the right */
    }

    /* Adjust hover effect if needed */
    .prev:hover,
    .next:hover {
        background-color: #348494;
    }
      .popSelect
      {
          color:#348494;
          font-weight: bold;
          background-color: white;
          width: 350px;
          padding: 10px;
          margin: auto;
          border-radius: 20px;

      }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <header>
      <h1>Welcome to Books of Sophia</h1>
      <p>Your Gateway to Wisdom and Imagination</p>
    </header>
    <div class="intro-text">
      <p>Explore our diverse collection of books that span genres, eras, and worlds. Unleash your curiosity, ignite your imagination, and embark on an unforgettable journey through the power of words.</p>
    </div>

    <div class="cardPop"><h1 class="popSelect">Popular Selections</h1></div>

    <div class="slider">
      <div class="card">
        <img src="https://compote.slate.com/images/4da82e91-cb46-4274-b71b-007119606030.jpg" />
      </div>
      <div class="card">
        <img src="https://media.harrypotterfanzone.com/deathly-hallows-us-childrens-edition-2013.jpg" />
      </div>
      <div class="card">
        <img src="https://i.pinimg.com/736x/8a/86/6d/8a866d42d846e3a3f8bd7285feca53fc.jpg" />
      </div>
      <div class="card">
        <img src="https://images.booksense.com/images/683/603/9780545603683.jpg" />
      </div>
      <div class="card">
        <img src="	https://media.springernature.com/full/springer-static/cover-hires/book/978-3-030-59758-0" />
      </div>
      <!-- Add more image sources here -->
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
       </div>
          </div>

    <asp:Button ID="Button1" CssClass="cta-button" runat="server" Height="52px" 
                Font-Size="larger" Text="Explore Now" OnClick="Button1_Click" />
  </form>
  <script>
      var slideIndex = 0;
      showSlides(slideIndex);

      function plusSlides(n) {
          showSlides(slideIndex += n);
      }

      function showSlides(n) {
          var i;
          var slides = document.querySelectorAll('.card');
          if (n >= slides.length) { slideIndex = 0; }
          if (n < 0) { slideIndex = slides.length - 1; }
          for (i = 0; i < slides.length; i++) {
              slides[i].style.display = 'none';
          }
          slides[slideIndex].style.display = 'block';
      }
  </script>
</body>
</html>
