<?php $__env->startPush('styles'); ?>
  <link href="<?php echo e(asset('css/dashboard.css')); ?>?4" rel="stylesheet" type="text/css">
    
  <link href="<?php echo e(asset('css/vectorcss/jquery-jvectormap.css')); ?>" rel="stylesheet" type="text/css">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="add-team">
                <div class="row">
                    <div class="col-sm-12">


                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $__env->startPush('map-scripts'); ?>
    
    <script src="<?php echo e(asset('js/vectorjs/jquery-jvectormap-1.2.2.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/vectorjs/jquery-jvectormap-world-mill-en.js')); ?>"></script>
    <script src="<?php echo e(asset('js/vectorjs/customemap.js')); ?>"></script>
    <?php $__env->stopPush(); ?>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.partials.dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>