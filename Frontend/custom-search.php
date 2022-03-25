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
            <a href="./index.php" class=" text-gray-300 px-3 py-2 rounded-md text-sm font-medium" >Home</a>

            <a href="./ocr.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">OCR</a>

            <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Notes</a>

            <a href="./custom-search.php" class=" bg-gray-900 text-white hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium" aria-current="page">Custom Search</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Mobile menu, show/hide based on menu state. -->
  <div class="hidden" id="mobile-menu">
    <div class="px-2 pt-2 pb-3 space-y-1">
      <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
      <a href="./index.php" class="text-gray-300 block px-3 py-2 rounded-md text-base font-medium" >Home</a>

      <a href="./ocr.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">OCR</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Notes</a>

      <a href="./custom-search.php" class="bg-gray-900 text-white hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium" aria-current="page">Custom Search</a>
    </div>
  </div>
</nav>

  <main id="main">
    <div class="container custom-search-box">
    <div class="items-center justify-between mb-10">
          <h1 class="header-text">Customised G Search</h1>
    </div>
      <h1>Optimised Google search, get only what you want!</h1>
        <label for="inputPassword5" class="form-label my-3">
          <strong>PDF Search</strong> 
        </label>
        <input
          id="search_pdf"
          type="text"
          class="form-control"
          aria-describedby="passwordHelpBlock"
        />
        <div id="passwordHelpBlock" class="form-text">
          You must enter some keywords which describes the pdf you want
        </div>
        <button
          type="submit"
          class="btn btn-outline-dark my-3"
          onclick="pdfsearch()"
        >
          Search
        </button>
        <button
          type="submit"
          class="btn btn-outline-dark my-3 mx-3"
          onclick="pdfclear()"
        >
          Clear
        </button>
      </div>
      <div class="container">
        <label for="inputPassword5" class="form-label my-3">
          <strong>MP3 Search</strong> 
        </label>
        <input
          id="search_mp3"
          type="text"
          class="form-control"
          aria-describedby="passwordHelpBlock"
        />
        <div id="passwordHelpBlock" class="form-text">
          You must enter some keywords which describes the mp3 you want
        </div>
        <button
          type="submit"
          class="btn btn-outline-dark my-3"
          id="mp3_search"
          onclick="mp3search()"
        >
          Search
        </button>
        <button
          type="submit"
          class="btn btn-outline-dark my-3 mx-3"
          onclick="mp3clear()"
        >
          Clear
        </button>
      </div>
      <div class="container">
        <label for="inputPassword5" class="form-label my-3">
          <strong>MP4 Search</strong> 
        </label>
        <input
          id="search_mp4"
          type="text"
          class="form-control"
        />
        <div id="passwordHelpBlock" class="form-text">
          You must enter some keywords which describes the mp4 you want
        </div>
        <button
          type="submit"
          class="btn btn-outline-dark my-3"
          id="mp4_search"
          onclick="mp4search()"
        >
          Search
        </button>
        <button
          type="submit"
          class="btn btn-outline-dark my-3 mx-3"
          onclick="mp4clear()"
        >
          Clear
        </button>
      </div>

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

  <!-- Custom Functions -->
  <script>
    function pdfsearch(){
      // console.log("PDF Search working");
      var pdf_text = document.getElementById("search_pdf").value;
      var new_pdf_text = pdf_text + " filetype:pdf";
      // console.log(new_pdf_text);
      let sertxt = "https://www.google.com/search?q=";
      let text = sertxt + new_pdf_text;
      window.open(text, "_blank")

    }
    function mp3search(){
      // console.log("MP3 Search working");
      var mp3_text = document.getElementById("search_mp3").value;
      var new_mp3_text = mp3_text + " filetype:mp3";
      // console.log(new_mp3_text);
      let sertxt = "https://www.google.com/search?q=";
      let text = sertxt + new_mp3_text;
      window.open(text, "_blank")

    }
    function mp4search(){
      // console.log("MP4 Search working");
      var mp4_text = document.getElementById("search_mp4").value;
      var new_mp4_text = mp4_text + " filetype:mp4";
      // console.log(new_mp4_text);
      let sertxt = "https://www.google.com/search?q=";
      let text = sertxt + new_mp4_text;
      window.open(text, "_blank")
    }
    function pdfclear(){
      document.getElementById("search_pdf").value = "";
    }
    function mp3clear(){
      document.getElementById("search_mp3").value = "";
    }
    function mp4clear(){
      document.getElementById("search_mp4").value = "";
    }
  </script>

</body>

</html>