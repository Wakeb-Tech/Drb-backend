<div class="navbar-custom-menu">
    <ul class="nav navbar-nav">
        <!-- Messages: style can be found in dropdown.less-->
        <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-envelope-o"></i>
                <span class="label label-success"><?php echo e(App\Models\Contact::where('seen', 0)->count()); ?></span>
            </a>
            <ul class="dropdown-menu">

                <li class="header">You have <?php echo e(App\Models\Contact::where('seen', 0)->count()); ?> messages</li>
                <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                        <?php $__currentLoopData = App\Models\Contact::take(3)->orderBy('created_at','DESC')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $contact): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li><!-- start message -->
                                <a href="<?php echo e(route('manage.single',['id'=>$contact->id])); ?>">
                                    <div class="pull-left">
                                        <img src="<?php echo e(asset('uploads/publishers/'.$contact->publisher->image)); ?>"
                                             class="img-circle" alt="User Image">
                                    </div>
                                    <h4>
                                      <?php echo e($contact->contact_number); ?>

                                        <small><i class="fa fa-clock-o"></i> <?php echo e($contact->created_at->diffForHumans()); ?></small>
                                    </h4>
                                    <h5><?php echo e($contact->email); ?></h5>
                                    <p><?php echo e($contact->subject); ?></p>
                                    <p><?php echo e($contact->desc); ?></p>
                                </a>
                            </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <!-- end message -->

                    </ul>
                <li class="footer"><a href="<?php echo e(route('manage.messages')); ?>">See All Messages</a></li>
            </ul>
        </li>
        <!-- Notifications: style can be found in dropdown.less -->










































        <!-- Tasks: style can be found in dropdown.less -->













































































        <!-- User Account: style can be found in dropdown.less -->
        <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="<?php echo e(url('/design/adminlte')); ?>/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                <span class="hidden-xs"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                    <img src="<?php echo e(url('/design/adminlte')); ?>/dist/img/user2-160x160.jpg" class="img-circle"
                         alt="User Image">

                    <p>
                        Alexander Pierce - Web Developer
                        <small>Member since Nov. 2012</small>
                    </p>
                </li>
                <!-- Menu Body -->
                <li class="user-body">
                    <div class="row">
                        <div class="col-xs-4 text-center">
                            <a href="#">Followers</a>
                        </div>
                        <div class="col-xs-4 text-center">
                            <a href="#">Sales</a>
                        </div>
                        <div class="col-xs-4 text-center">
                            <a href="#">Friends</a>
                        </div>
                    </div>
                    <!-- /.row -->
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                    <div class="pull-left">
                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                        <form method="POST" action="<?php echo e(route('logout')); ?>">
                            <?php echo csrf_field(); ?>
                            <button type="submit" class="btn btn-default btn-flat">Sign out</button>
                        </form>
                    </div>
                </li>
            </ul>
        </li>
        <!-- Control Sidebar Toggle Button -->
        <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
        </li>
    </ul>
</div>
<?php /**PATH /var/www/laravel/resources/views/admin/layouts/menu.blade.php ENDPATH**/ ?>