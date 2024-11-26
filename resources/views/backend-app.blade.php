<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="icon" href="{{ asset('favicon.png') }}" type="image/png" />
    <title>Skill Syntax - Controls</title>

    <link rel="stylesheet" href="{{asset('backend/assets/vendors/mdi/css/materialdesignicons.min.css')}}" />
    <link rel="stylesheet" href="{{asset('backend/assets/vendors/flag-icon-css/css/flag-icon.min.css')}}" />
    <link rel="stylesheet" href="{{asset('backend/assets/vendors/css/vendor.bundle.base.css')}}" />
    <link rel="stylesheet" href="{{asset('vendors/font-awesome/css/all.min.css')}}" />
    <link rel="stylesheet" href="{{asset('backend/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css')}}" />
    <link rel="stylesheet" href="{{asset('backend/assets/css/style.css')}}" />

    <!-- vue app css -->
     <link rel="stylesheet" href="{{asset('vue-app/backend/css/app.css')}}" />
</head>
<body>

<div id="app">
    <App/>
</div>

<script src="{{asset('backend/assets/vendors/js/vendor.bundle.base.js')}}"></script>
<script src="{{asset('backend/assets/vendors/chart.js/Chart.min.js')}}"></script>
<script src="{{asset('backend/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js')}}"></script>
<script src="{{asset('backend/assets/vendors/flot/jquery.flot.js')}}"></script>
<script src="{{asset('backend/assets/vendors/flot/jquery.flot.resize.js')}}"></script>
<script src="{{asset('backend/assets/vendors/flot/jquery.flot.categories.js')}}"></script>
<script src="{{asset('backend/assets/vendors/flot/jquery.flot.fillbetween.js')}}"></script>
<script src="{{asset('backend/assets/vendors/flot/jquery.flot.stack.js')}}"></script>
<script src="{{asset('backend/assets/vendors/flot/jquery.flot.pie.js')}}"></script>
<script src="{{asset('backend/assets/js/off-canvas.js')}}"></script>
<script src="{{asset('backend/assets/js/hoverable-collapse.js')}}"></script>
<script src="{{asset('backend/assets/js/misc.js')}}"></script>


<!-- vue app -->

<script>
    window.baseUrl = "{{url('/')}}";
    window.authUser = "{{ auth()->user() ? auth()->user()->toJson() : 'null' }}";
</script>
<script src="{{asset('vue-app/backend/js/app.js')}}"></script>

<!-- End Js section -->

</body>
</html>