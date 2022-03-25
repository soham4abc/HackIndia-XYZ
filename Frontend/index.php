<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Study Helper</title>
  <meta content="An application with multiple features | Optical Character Recognition | Notes | Customized search" name="description">
  <meta content="" name="keywords">

  <link href="" rel="icon">
  <link href="" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>

  <!-- ======= Header ======= -->
  <!-- <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
      <a href="#hero" class="logo"><img src="PicsArt_12-11-06.58.40.jpg" alt="logo" class="img-fluid"></a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="./ocr.php">OCR</a></li>
          <li><a class="nav-link scrollto" href="#">Notes</a></li>
          <li><a class="nav-link scrollto" href="./custom-search.php">Custom Search</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>

    </div>
  </header> -->
  <!-- End Header -->

<!-- This example requires Tailwind CSS v2.0+ -->
<nav class="bg-gray-800">
  <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
    <div class="relative flex items-center justify-between h-16">
      <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
        <!-- Mobile menu button-->
        <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false" onclick="DisplayMobile()">
          <span class="sr-only">Open main menu</span>
          <!--
            Icon when menu is closed.

            Heroicon name: outline/menu

            Menu open: "hidden", Menu closed: "block"
          -->
          <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
          <!--
            Icon when menu is open.

            Heroicon name: outline/x

            Menu open: "block", Menu closed: "hidden"
          -->
          <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
      <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
        <div class="flex-shrink-0 flex items-center">
          <img class="hidden lg:block h-8 w-auto" src="./OCR icon.png" alt="Workflow">
        </div>
        <div class="hidden sm:block sm:ml-6">
          <div class="flex space-x-4">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <a href="./index.php" class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium" aria-current="page">Home</a>

            <a href="./ocr.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">OCR</a>

            <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Notes</a>

            <a href="./custom-search.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Custom Search</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Mobile menu, show/hide based on menu state. -->
  <div class="hidden" id="mobile-menu">
    <div class="px-2 pt-2 pb-3 space-y-1">
      <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
      <a href="./index.php" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium" aria-current="page">Home</a>

      <a href="./ocr.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">OCR</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Notes</a>

      <a href="./custom-search.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Custom Search</a>
    </div>
  </div>
</nav>


  

  <main id="main">

   
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">
      <div class="items-center justify-between mb-10">
          <h1 class="header-text">Study Helper</h1>
          </div>

        <div class="row">
          
          
          <div class="col-lg-6 items-center justify-between">
            <img src="./OCR image.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 content">
            <h3><p class="fst-italic">OCR is perhaps the best features we are providing</p></h3>
            <ul>
              <li><i class="bi bi-check-circle"></i>This OCR software helps you to achieve higher productivity by facilitating quicker data retrieval when required. </li>
              <li><i class="bi bi-check-circle"></i>Automated data entry tool results in reduced errors and inaccuracies, resulting in efficient data entry. </li>
            </ul>
            <p>
              We value your productivity, accuracy and privacy as much you do. Our server is regularly inspected to keep it secure.
            </p>
          </div>
        </div>
        <div class="row">
          
          <div class="col-lg-6 pt-4 pt-lg-0 content">
            <h3><p class="fst-italic">All notes available here, don't worry about exams.</p></h3>
            <ul>
              <li><i class="bi bi-check-circle"></i>Students? Teachers? A learner? Don't worry, this application is for you all to take and keep urgent notes instantly. </li>
              <li><i class="bi bi-check-circle"></i>A ready to search option to find your most needy note at least time.</li>
            </ul>
            <p>
              An efficient part of our application for your help in educational growth.
            </p>
          </div>
          <div class="col-lg-6">
            <img src="./Notes.png" class="img-fluid" alt="">
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <img src="./Google search.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 content">
            <h3><p class="fst-italic">Tired of getting wrong google results? Try this out!</p></h3>
            <ul>
              <li><i class="bi bi-check-circle"></i>Optimised google search so that you can reach to your result instantly with less effort. </li>
              <li><i class="bi bi-check-circle"></i>Search category wise, get categorized result. </li>
            </ul>
            <p>
              Smart search, save time.
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->



     <!-- ======= Team Section ======= -->
<!-- <section id="team" class="team section-bg">
    <div class="container">

      <div class="section-title">
        <span>Team</span>
        <h2>Team</h2>
        <p>We are a team of computer enthusiasts exploring new opportunities.</p>
      </div>

      <div class="row">
        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
          <div class="member">
            <img src="IMG-20210928-WA0007.jpg" alt="Soham Banerjee">
            <h4>Soham Banerjee</h4>
            <span>Backend Developer</span>
            <p>A not so average coder trying to explore oppurtunities.</p>
            <div class="social">
              <a target="_blank" href="https://www.instagram.com/debugginglife_02"><i class="bi bi-instagram"></i></a>
              <a target="_blank" href="https://www.linkedin.com/in/soham-banerjee-6091831b3/"><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
          <div class="member">
            <img src="IMG20191028160454.jpg" alt="Subhadip Dutta">
            <h4>Subhadip Dutta</h4>
            <span>Frontend Developer</span>
            <p>An aspiring coder looking forward to learn new things.</p>
            <div class="social">
              <a target="_blank" href="https://www.instagram.com/lol_sudu"><i class="bi bi-instagram"></i></a>
              <a target="_blank" href="https://www.linkedin.com/in/subhadip-dutta-32b7551b4/"><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
          <div class="member">
            <img src="ssir.jpeg" alt="Sumon Sen">
            <h4>Sumon Sen</h4>
            <span>Guide &amp; Server maintainance </span>
            <p>An experienced coder who guided his sudents with all that they needed.</p>
            <div class="social">
              <a target="_blank" href="https://www.instagram.com/im_sumon"><i class="bi bi-instagram"></i></a>
              <a target="_blank" href="https://www.linkedin.com/in/sumonsenind/"><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
        </div>

      </div>

    </div>
  </section>End Team Section -->

  
    

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>2022</span></strong>. All Rights Reserved. By Team -<strong> XYZ </strong>.
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/custom.js"></script>

</body>

</html>