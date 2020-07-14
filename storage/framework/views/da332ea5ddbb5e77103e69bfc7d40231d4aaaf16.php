<?php $__env->startSection('cs'); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('bread'); ?>
    <li><a href="<?php echo e(route('locations.index')); ?>" style="color: white">Manage Event Countries</a></li>
    <li class="active" style="color: white;font-size: larger"> Edit  Event Countries </li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Edit Event Country</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="<?php echo e(route('locations.update', ['id'=>$location->id])); ?>" method="post" enctype="multipart/form-data">
                    
                    <?php echo e(csrf_field()); ?>

                    <?php echo e(method_field('put')); ?>


                    <div class="box-body">
                        <div class="form-group">
                            <label for="name_ar">Enter Arabic Country Name</label>
                            <input type="text" name="name_ar" class="form-control" id="name_ar"
                                   placeholder="Description" value="<?php echo e($location->name_ar); ?>">
                        </div>


                       <div class="form-group">
                            <label for="name_en">Enter English Country Name</label>
                            <input type="text" name="name_en" class="form-control" id="name_en"
                                   placeholder=" English Event Country Name " value="<?php echo e($location->name_en); ?>">
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

<?php echo $__env->make('admin.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/laravel/resources/views/locations/edit.blade.php ENDPATH**/ ?>