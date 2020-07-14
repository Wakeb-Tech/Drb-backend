<header class="main-header">
    <!-- Logo -->
    <a style="color: white"href="#" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>A</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Admin</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <?php echo $__env->make('admin.layouts.menu', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar" style="background-color: #1d68a7;color: white">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php echo e(url('/design/adminlte')); ?>/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>Admin</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree" >










            <li><a style="color: white" href="<?php echo e(route('home')); ?>"><i class="fa fa-tasks "></i> <span>Home</span></a></li>

            <li><a style="color: white" href="<?php echo e(route('user.index')); ?>"><i class="fa fa-user-circle "></i> <span>Manage Users</span></a></li>


            <li><a style="color: white" href="<?php echo e(route('store.index')); ?>"><i class="fa fa-tasks  "></i> <span>Manage Service Providers </span></a></li>

            <li style="color: white" class="treeview">
                <a style="color: white" href="#">
                    <i style="color: white" class="fa fa-tasks"></i>
                    <span>Manage Events</span>
                    <span class="pull-right-container">
            </span>
                </a>
                <ul class="treeview-menu">

                    <li><a style="color: white" href="<?php echo e(route('categories.index')); ?>"><i class="fa fa-tasks  "></i> <span>Manage Event Categories  </span></a></li>

                    <li><a style="color: white" href="<?php echo e(route('locations.index')); ?>"><i class="fa fa-tasks  "></i> <span>Manage Event Country  </span></a></li>
                    <li><a style="color: white" href="<?php echo e(route('cities.index')); ?>"><i class="fa fa-tasks  "></i> <span>Manage Event City  </span></a></li>
                    <li><a style="color: white" href="<?php echo e(route('topics.index')); ?>"><i class="fa fa-tasks  "></i> <span>Manage Event Topics  </span></a></li>
                    <li><a style="color: white" href="<?php echo e(route('events.index')); ?>"><i class="fa fa-calendar  "></i> <span>Manage Events   </span></a></li>

                </ul>
            </li>


            

            <li><a  style="color: white" href="<?php echo e(route('place.index')); ?>"><i class="fa fa-tasks "></i> <span>Manage Suggested places </span></a></li>

            <li style="color: white" class="treeview">
                <a style="color: white" href="#">
                    <i style="color: white" class="fa fa-tasks"></i>
                    <span>Manage More Informations</span>
                    <span class="pull-right-container">
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a style="color: white" href="<?php echo e(route('road.index')); ?>"><i class="fa fa-circle-o"></i> Road Risk</a></li>
                    <li><a style="color: white" href="<?php echo e(route('trip.index')); ?>"><i class="fa fa-circle-o"></i> Trips</a></li>
                    <li><a style="color: white" href="<?php echo e(route('image.index')); ?>"><i class="fa fa-circle-o"></i> Image Gallery</a></li>
                    <li><a  style="color: white" href="<?php echo e(route('video.index')); ?>"><i class="fa fa-circle-o"></i> Video Gallery</a></li>
                </ul>
            </li>

            <li><a  style="color: white" href="<?php echo e(route('feedback.index')); ?>"><i class="fa fa-tasks "></i> <span>Manage FeedBack </span></a></li>

            <li><a style="color: white" href="<?php echo e(route('notification.index')); ?>"><i class="fa fa-tasks "></i> <span>Manage Notifications </span></a></li>

            <li><a style="color: white" href="<?php echo e(route('manage.index')); ?>"><i class="fa fa-tasks "></i> <span>Manage In-App Content </span></a></li>





        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<?php /**PATH /var/www/laravel/resources/views/admin/layouts/navbar.blade.php ENDPATH**/ ?>