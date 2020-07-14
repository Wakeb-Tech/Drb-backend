<?php $__env->startSection('cs'); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('bread'); ?>
    <li><a href="<?php echo e(route('cities.index')); ?>" style="color: white">Manage Event City</a></li>
    <li class="active" style="color: white;font-size: larger"> Add Event City </li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Add New Event City</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="<?php echo e(route('cities.store')); ?>" method="post" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <div class="box-body">
                        <div class="form-group">
                            <label>Countries</label>
                            <select name="country_id" class="form-control">
                                <option value="">All Countries</option>
                                <?php $__currentLoopData = $countries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($country->id); ?>" <?php echo e(old('country_id') == $country->id ? 'selected' : ''); ?>><?php echo e($country->name_ar); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>

                        <div class="form-group">

                            <label for="name_ar">Enter Arabic City Name</label>
                            <input type="text" name="name_ar" class="form-control" id="name_ar"
                                   placeholder="Arabic City Name" value="<?php echo e(old('name_ar')); ?>">
                        </div>

                        <div class="form-group">
                            <label for="name_en">Enter English  City Name</label>
                            <input type="text" name="name_en" class="form-control" id="name_en"
                                   placeholder=" English City Name " value="<?php echo e(old('name_en')); ?>">
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


<?php echo $__env->make('admin.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/laravel/resources/views/cities/add.blade.php ENDPATH**/ ?>