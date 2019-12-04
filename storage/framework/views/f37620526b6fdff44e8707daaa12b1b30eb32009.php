<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('css/login-style.css')); ?>?4" rel="stylesheet" type="text/css">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div id="app" class="outer reset">
        <div class="middle">
              <div class="middle-align">
            <div class="text-center logo">
                <img src="<?php echo e(asset('img/fanlyfe-logo-cms.jpg')); ?>" alt="PTS Logo">
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Reset Password</div>
                <div class="panel-body">
                    <?php if(session('status')): ?>
                        <div class="alert alert-success">
                            <?php echo e(session('status')); ?>

                        </div>
                    <?php endif; ?>
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" method="POST" action="<?php echo e(route('password.email')); ?>">
                        <?php echo e(csrf_field()); ?>


                        <div class="form-group<?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                            <label for="email" class="control-label">E-Mail Address</label>

                            <div class="">
                                <input id="email" type="email" class="form-control" name="email" value="<?php echo e(old('email')); ?>" required>

                                <?php if($errors->has('email')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('email')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="">
                                <button type="submit" class="btn btn-success btn-block btn-lg">
                                    Send Password Reset Link
                                </button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
    </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.partials.base', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>