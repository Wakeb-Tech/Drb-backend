<?php echo $__env->make('admin.layouts.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

<?php echo $__env->make('admin.layouts.navbar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

<!-- Content Wrapper. Contains page content بيسسيبيس -->
<div class="content-wrapper" style="background-color: white">
    <!-- Content Header (Page header) -->
    <section class="content-header">








    </section>

    <!-- Main content -->
    <section class="content">
        <div class="loading">Loading&#8230;</div>
    <div class="loading">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>


        <?php echo $__env->make('admin.layouts.message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <ul class="breadcrumb" style="background-color: #1d68a7">
            <li><a href="<?php echo e(route('home')); ?>" style="color: white">Home</a></li>
            <?php echo $__env->yieldContent('bread'); ?>
        </ul>
        <?php echo $__env->yieldContent('content'); ?>




    </section>
    <!-- /.content -->
</div>
<?php echo $__env->make('admin.layouts.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php /**PATH /var/www/laravel/resources/views/admin/index.blade.php ENDPATH**/ ?>