<!-- Main Header -->
<header class="main-header fanlyfe">

    <!-- Logo -->
    <a href="<?php echo e(url('/home')); ?>" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini">
            <img src="<?php echo e(asset('img/fanlyfe-ico.png')); ?>" alt="brand logo">
        </span>
        <!-- logo for regular state and mobile devices -->
        <img src="<?php echo e(asset('img/fanlyfe-logo-white.png')); ?>" alt="brand logo">
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">
                
            </span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Notifications Menu -->
                <li class="dropdown notifications-menu">
                    <!-- Menu toggle button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">10</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header"></li>
                        <li>
                            <!-- Inner Menu: contains the notifications -->
                            <ul class="menu">
                                <li><!-- start notification -->
                                    <a href="#">
                                        <i class="fa fa-users text-aqua"></i> 
                                    </a>
                                </li><!-- end notification -->
                            </ul>
                        </li>
                        <li class="footer"><a href="#"></a></li>
                    </ul>
                </li>
                <!-- Tasks Menu -->
                <?php if(Auth::guest()): ?>
                    <li><a href="<?php echo e(url('/register')); ?>"></a></li>
                    <li><a href="<?php echo e(url('/login')); ?>"></a></li>
                <?php else: ?>
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu" id="user_menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="<?php echo e(asset('img/avatar5.png')); ?>" class="user-image" alt="User Image"/>
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">Willie Nelson</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div>
                                    <div>
                                        <div class="setting">
                                            <i class="fa fa-cog" aria-hidden="true"></i>
                                            <a href="<?php echo e(url('/settings')); ?>" class="btn btn-default btn-flat btn-width">Setting
                                                <?php echo e(trans('adminlte_lang::message.profile')); ?>

                                            </a>
                                        </div>
                                        <div class="logout">
                                            <i class="fa fa-sign-out" aria-hidden="true"></i>
                                            <a href="<?php echo e(url('/logout')); ?>" class="btn btn-default btn-flat btn-width" id="logout"
                                               onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
                                                

                                                Logout
                                            </a>

                                        </div>
                                    </div>




                                </div>
                            </li>
                        </ul>
                    </li>
                <?php endif; ?>

                <!-- Control Sidebar Toggle Button -->

            </ul>
        </div>
    </nav>
</header>
