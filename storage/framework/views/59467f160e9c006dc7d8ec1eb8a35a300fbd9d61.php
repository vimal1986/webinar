<?php $__env->startPush('styles'); ?>
    <link href="<?php echo e(asset('css/login-style.css')); ?>?4" rel="stylesheet" type="text/css">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('htmlheader_title'); ?>
    Log in
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div id="app" class="outer">
        <div class="middle">
            <div class="middle-align">
            <?php if(count($errors) > 0): ?>
                <div class="alert alert-danger">
                    <strong>Whoops!</strong>
                    <ul>
                        <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li><?php echo e($error); ?></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            <?php endif; ?>
            <div class="text-center logo">
                <img style="width: 50%" src="<?php echo e(asset('image/theplug-logo-cms.png')); ?>" alt="The Plug Logo">
            </div>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="<?php echo e(route('login')); ?>">
                    <?php echo e(csrf_field()); ?>


                        <div class="form-group<?php echo e($errors->has('email') ? ' has-error' : ''); ?>">

                            <div class="col-md-12">
                                <input class="form-control" placeholder="E-mail" name="email" type="email"
                                       autofocus>

                                <?php if($errors->has('email')): ?>
                                    <span class="help-block">
                                            <strong><?php echo e($errors->first('email')); ?></strong>
                                        </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">

                            <div class="col-md-12">
                                <input id="password" type="password" class="form-control" name="password"
                                       placeholder="Password" required>

                                <?php if($errors->has('password')): ?>
                                    <span class="help-block">
                                            <strong><?php echo e($errors->first('password')); ?></strong>
                                        </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"
                                               name="remember" <?php echo e(old('remember') ? 'checked' : ''); ?>> Remember
                                        Me
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-success btn-block btn-lg">
                                    Login
                                </button>

                                <a class="btn btn-link pull-left"
                                   href="<?php echo e(route('password.request')); ?>">
                                    Forgot Your Password?
                                </a>

                                
                                   
                                    
                                
                            </div>
                        </div>
                     </form>
                </div>
            </div>

        </div>
        </div>
    </div>

    <?php $__env->startPush('scripts'); ?>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });
            });
        </script>
    <?php $__env->stopPush(); ?>
    </body>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.partials.base', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>