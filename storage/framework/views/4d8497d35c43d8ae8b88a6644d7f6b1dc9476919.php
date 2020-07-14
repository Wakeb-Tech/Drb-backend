<?php $__env->startSection('cs'); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('bread'); ?>
    <li><a href="<?php echo e(route('categories.index')); ?>" style="color: white">Manage  Event Categories Places</a></li>
    <li class="active" style="color: white;font-size: larger"> Add New Category </li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Add New Category</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="<?php echo e(route('categories.store')); ?>" method="post" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="name_ar">Enter Arabic Category Name</label>
                            <input type="text" name="name_ar" class="form-control" id="name_ar"
                                   placeholder="Arabic Category Name" value="<?php echo e(old('name_ar')); ?>">
                        </div>

                        <div class="form-group">
                            <label for="name_en">Enter English Category Name</label>
                            <input type="text" name="name_en" class="form-control" id="name_en"
                                   placeholder=" English Category Name " value="<?php echo e(old('name_en')); ?>">
                        </div>

                        <div class="form-group">
                            <label for="desc_ar">Enter Arabic Category Description</label>
                            <input type="text" name="desc_ar" class="form-control" id="desc_ar"
                                   placeholder="Arabic Category Description" value="<?php echo e(old('desc_ar')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="desc_en">Enter English Category Description</label>
                            <input type="text" name="desc_en" class="form-control" id="desc_en"
                                   placeholder="English Category Description" value="<?php echo e(old('desc_en')); ?>">
                        </div>


                 
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('js'); ?>

    <script type="text/javascript">
        function initMap() {
            var latlng = new google.maps.LatLng('30.044281', '31.340002');
            var map = new google.maps.Map(document.getElementById('map'), {
                center: latlng,
                zoom: 15,
                disableDefaultUI: true,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });


            var marker = new google.maps.Marker({
                position: latlng,
                animation: google.maps.Animation.DROP,
                map: map,
                draggable: true
            });


            google.maps.event.addListener(marker, 'dragend', function (event) {
                document.getElementById("lat").value = this.getPosition().lat();
                document.getElementById("lng").value = this.getPosition().lng();
                var latitude = roundOf(this.getPosition().lat(), 4);
                var longitude = roundOf(this.getPosition().lng(), 4);

                function roundOf(n, p) {
                    const n1 = n * Math.pow(10, p + 1);
                    const n2 = Math.floor(n1 / 10);
                    if (n1 >= (n2 * 10 + 5)) {
                        return (n2 + 1) / Math.pow(10, p);
                    }
                    return n2 / Math.pow(10, p);
                }

                var urlTo = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + latitude + "," +
                    longitude + "&key=AIzaSyC5uC_mExFIMSehvCgsjegxcF7mTpKmI4w&sensor=true&language=ar";
                $.ajax({
                    url: [urlTo],
                    cache: false,
                    success: function (data) {
                        var address = data.results[0].formatted_address;
                        console.log(latitude)
                        $("input[name='lat']").val(latitude);
                        $("input[name='lng']").val(longitude);
                        $("input[name='address']").val(address);
                        $('.loc').html(address).fadeIn();
                    }
                });
            });

        }
    </script>


    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB90FxtYG_ybAYXGkz0ybkmkboE2nEbezI&callback=initMap&libraries=places">
    </script>



<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/laravel/resources/views/categories/add.blade.php ENDPATH**/ ?>