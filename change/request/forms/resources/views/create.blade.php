<html lang="en">
  <head>
    <title>Laravel 8 Multiple File Upload Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    <!-- <link rel="stylesheet" href="3.3.6/css/bootstrap.min.css"> -->
  </head>
  <body class="bg-dark">
    <div class="container mt-5 lst">
      @if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>Sorry!</strong> There were more problems with your HTML input.<br><br>
            <ul>
              @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
              @endforeach
            </ul>
        </div>
      @endif
      @if(session('success'))
        <div class="alert alert-success">
          {{ session('success') }}
        </div> 
      @endif 
      <div class="card">
        <div class="card-header">
          <h3 class="well">Laravel 8 Multiple File upload Example Tutorial</h3>
        </div>
        <div class="card-body">
          <form method="post" action="{{ route('document.upload') }}" enctype="multipart/form-data">
            @csrf
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label>File:</label>
                  <input type="file" class="form-control" name="file[]" multiple>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <button class="btn btn-success btn-block" type="submit">Submit</button>
              </div>
            </div>
          </form> 
        </div>
      </div>       
    </div>
  </body>
</html>