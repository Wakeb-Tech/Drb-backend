<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3><?php echo e($trip_count); ?></h3>

                    <p>Number Trips</p>
                </div>
                <div class="icon">
                    <i class="fa fa-bus"></i>
                </div>
                <a href="<?php echo e(route('trip.index')); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3><?php echo e($risk_count); ?></h3>

                    <p>Roads Risks</p>
                </div>
                <div class="icon">
                    <i class="fa fa-exclamation-triangle"></i>
                </div>
                <a href="<?php echo e(route('road.index')); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><?php echo e($publisher_count); ?></h3>

                    <p>User Registrations</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
                <a href="<?php echo e(route('user.index')); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3><?php echo e($count_service); ?></h3>

                    <p>Service Providers</p>
                </div>
                <div class="icon">
                    <i class="fa fa-home"></i>
                </div>
                <a href="<?php echo e(route('store.index')); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->
    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <!-- /.nav-tabs-custom -->





        </section>
        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-5 connectedSortable">

            <!-- Map box -->

            <!-- /.box -->

        </section>
        <!-- right col -->
    </div>
    <!-- /.row (main row) -->
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/laravel/resources/views/home.blade.php ENDPATH**/ ?>